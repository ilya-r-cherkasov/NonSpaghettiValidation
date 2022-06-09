//
//  PupilProtocol.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import UIKit

// TODO: Просочился UIKit :( но боюсь, другой способ держать цвет будет не оч

protocol PupilProtocol: AnyObject {
    
    var shape: ShapeType { get set }
    var color: UIColor { get set }
    var nickname: String { get set }
    var isWantGoTrip: Bool { get set }
    
}
