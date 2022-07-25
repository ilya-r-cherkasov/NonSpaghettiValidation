//
//  Moon.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import UIKit
import Referee

final class Moon: Pupil {
    
    var validator: Validator = Validator()
    weak var votersProvider: VotersProvider?
    var shape: ShapeType = .neutral
    var color: UIColor = .white
    var nickname: String = "Moon"
    var isWantGoTrip: Bool = false
    
}
