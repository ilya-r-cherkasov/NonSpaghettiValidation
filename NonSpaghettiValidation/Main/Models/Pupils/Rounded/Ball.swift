//
//  Ball.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import UIKit
import Referee

final class Ball: Pupil {
    
    var validator: Validator = Validator()
    weak var votersProvider: VotersProvider?
    var shape: ShapeType = .rounded
    var color: UIColor = .white
    var nickname: String = "Ball"
    var isWantGoTrip: Bool = false
    
}
