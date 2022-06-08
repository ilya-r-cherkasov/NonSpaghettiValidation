//
//  Mediator.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import UIKit

final class Mediator: PupilProtocol {
    
    // MARK: - Internal properties
    
    var shape: ShapeType = .nonDefined
    var nickname: String = "Mediator"
    var color: UIColor = .white
    var isWantGoTrip: Bool = false
    
}
