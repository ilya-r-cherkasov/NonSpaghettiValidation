//
//  MainPresenter.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 07.06.2022.
//

import Referee

final class MainPresenter: MainViewOutput {
    
    // MARK: - Nested types
    
    typealias Teacher = Referee
    
    // MARK: - Internal properties
    
    weak var view: MainViewInput?
    
    // MARK: - Private properties
    
    private lazy var teacher: Teacher = {
        Teacher.make(with: [
            Mediator(),
            Star(),
            Moon(),
            HeliumBalloon(),
            AirBalloon(),
            Ball(),
            Needle(),
            Trident(),
            Knife()
        ])
    }()
    
    // MARK: - MainViewOutput
    
    func viewDidLoad() {
        view?.configure(
            withFileds: teacher.voters
                .compactMap { $0 as? ViewRepresentable }
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
        let conficts = teacher.startVoting()
        print(conficts.isEmpty)
    }
    
}

extension MainPresenter: Refereing {
    
    var voters: Voters {
        VotersGroup {
            VotersGroup {
                Mediator()
            }
            VotersRules {
                VotersGroup {
                    Mediator()
                    Trident()
                }
            }
        }
    }
    
}
