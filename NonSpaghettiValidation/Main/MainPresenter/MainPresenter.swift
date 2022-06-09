//
//  MainPresenter.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 07.06.2022.
//

import Foundation

final class MainPresenter: MainViewOutput {
    
    // MARK: - Internal properties
    
    weak var view: MainViewInput?
    
    // MARK: - Private properties
    
    
    // TODO: тут лучше Set, но надо требовать Hashable
    private var pupilList: [PupilProtocol] = [
        Mediator(),
        Star(),
        Moon(),
        HeliumBalloon(),
        AirBalloon(),
        Ball(),
        Needle(),
        Trident(),
        Knife()
    ]
    
    // MARK: - MainViewOutput
    
    func viewDidLoad() {
        view?.configure(
            withFileds: pupilList.map { pupil in
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
        print(pupilList)
    }
    
}
