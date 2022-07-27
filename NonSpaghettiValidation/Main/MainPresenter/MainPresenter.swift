//
//  MainPresenter.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 07.06.2022.
//

import Referee

final class MainPresenter: MainViewOutput, Refereing {
    
    // MARK: - Internal properties
    
    weak var view: MainViewInput?
    
    lazy var votersBody: Voters = {
        
        let nonEmptyRule = DefaultOneTwoOneRule(priority: .hight, tag: "firstRule") { voting in
            guard let pupil = voting as? Moon else {
                return true
            }
            return !pupil.nickname.isEmpty
        }
        
        let oneCharRule = DefaultOneTwoOneRule(priority: .hight, tag: "oneCharRule") { voting in
            guard let pupil = voting as? Moon else {
                return true
            }
            return pupil.nickname.count != 1
        }
        
        let twoCharRule = DefaultOneTwoOneRule(priority: .hight, tag: "twoCharRule") { voting in
            guard let pupil = voting as? Moon else {
                return true
            }
            return pupil.nickname.count != 2
        }
        
        return VotersGroup {
            VotersGroup {
                Mediator()
                Star()
                Moon()
            }
            VotersRules(nonEmptyRule) {
                VotersGroup {
                    AirBalloon()
                    Ball()
                }
                VotersRules(oneCharRule) {
                    Needle()
                    Knife()
                }
                VotersRules(twoCharRule) {
                    HeliumBalloon()
                    Trident()
                }
            }
        }
    }()
    
    // MARK: - MainViewOutput
    
    func viewDidLoad() {
        view?.configure(
            withFileds:
                votersBody.voters.compactMap { $0 as? ViewRepresentable }
                .map { pupil in
                    var model = InputCellModel(
                        nickname: pupil.nickname,
                        color: pupil.color
                    )
                    model.nicknameChanged = { [weak pupil] nickname in
                        pupil?.nickname = nickname
                    }
                    model.goTripStatusChanged = { [weak pupil] isWantGoTrip in
                        pupil?.isWantGoTrip = isWantGoTrip
                    }
                    return model
                }
        )
    }
    
    func nextButtonTapped() {
        let conficts = startVoting()
        print(conficts.isEmpty)
    }
    
}
