//
//  Needle.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import UIKit

final class Needle: PupilProtocol {
    
    weak var delegate: PupilDelegate?
    var shape: ShapeType = .sharp
    var color: UIColor = .white
    var nickname: String = "Needle"
    var isWantGoTrip: Bool = false
    
}
