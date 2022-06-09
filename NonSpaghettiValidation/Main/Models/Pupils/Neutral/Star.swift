//
//  Star.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import UIKit

final class Star: PupilProtocol {
    
    weak var delegate: PupilDelegate?
    var shape: ShapeType = .neutral
    var color: UIColor = .yellow
    var nickname: String = "Star"
    var isWantGoTrip: Bool = false
    
}
