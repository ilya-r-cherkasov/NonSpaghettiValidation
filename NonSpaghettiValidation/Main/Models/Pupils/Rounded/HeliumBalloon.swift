//
//  HeliumBalloon.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import UIKit
import Referee

final class HeliumBalloon: Pupil {
    
    weak var votersProvider: VotersProvider?
    var shape: ShapeType = .rounded
    var color: UIColor = .white
    var nickname: String = "HeliumBalloon"
    var isWantGoTrip: Bool = false
    
}
