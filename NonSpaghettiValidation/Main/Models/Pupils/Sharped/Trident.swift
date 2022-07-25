//
//  Trident.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import UIKit
import Referee

final class Trident: Pupil {
    
    var validator: Validator = Validator()
    weak var votersProvider: VotersProvider?
    var shape: ShapeType = .sharp
    var color: UIColor = .white
    var nickname: String = "Trident"
    var isWantGoTrip: Bool = false
    
}
