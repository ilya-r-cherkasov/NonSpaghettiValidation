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
            withFileds: teacher.surveyableObjects
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
        let isNoConflict = teacher.startSurvey()
        print(isNoConflict)
    }
    
}
