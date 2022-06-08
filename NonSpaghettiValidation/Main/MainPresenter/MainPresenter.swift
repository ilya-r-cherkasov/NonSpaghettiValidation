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
    
    private var pupilList: [PupilProtocol] = [ //тут лучше Set, но надо требовать Hashable
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
    
    func loadData() {
        view?.configure(
            withFileds: pupilList.map {
                InputCellModel(
                    title: $0.nickname,
                    color: $0.color
                )
            }
        )
    }
    
}

private extension MainPresenter {
    
    
    
}
