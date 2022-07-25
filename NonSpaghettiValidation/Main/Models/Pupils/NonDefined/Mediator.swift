//
//  Mediator.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import UIKit
import Referee

final class Mediator: Pupil {
    
    // MARK: - Internal properties
    
    weak var votersProvider: VotersProvider?
    var shape: ShapeType = .nonDefined
    var nickname: String = "Mediator"
    var color: UIColor = .white
    var isWantGoTrip: Bool = false
    
}
