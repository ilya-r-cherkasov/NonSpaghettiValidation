//
//  Knife.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import UIKit

final class Knife: Pupil {
    
    weak var pupilListProvider: PupilListProvider?
    var shape: ShapeType = .sharp
    var color: UIColor = .green
    var nickname: String = "Knife"
    var isWantGoTrip: Bool = false
    
}
