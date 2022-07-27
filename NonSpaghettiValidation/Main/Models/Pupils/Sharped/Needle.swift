//
//  Needle.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import UIKit
import Referee

final class Needle: Pupil {
    
    var validator: Validator = Validator()
    weak var votersProvider: VotersProvider?
    var shape: ShapeType = .sharp
    var color: UIColor = .white
    var nickname: String = "Needle"
    var isWantGoTrip: Bool = false
    
    func checkYourself() -> [Conflict] {
        isWantGoTrip ? [] : [DefaultConflict(tag: "Needle non active", priority: .medium)]
    }
    
}
