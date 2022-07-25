//
//  Star.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import UIKit
import Referee

final class Star: Pupil {
    
    weak var votersProvider: VotersProvider?
    var shape: ShapeType = .neutral
    var color: UIColor = .yellow
    var nickname: String = "Star"
    var isWantGoTrip: Bool = false
    
}
