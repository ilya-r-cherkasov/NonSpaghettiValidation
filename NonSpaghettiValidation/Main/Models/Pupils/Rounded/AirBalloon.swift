//
//  AirBalloon.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import UIKit

final class AirBalloon: Pupil {
    
    weak var pupilListProvider: PupilListProvider?
    var shape: ShapeType = .rounded
    var color: UIColor = .white
    var nickname: String = "AirBalloon"
    var isWantGoTrip: Bool = false
    
}
