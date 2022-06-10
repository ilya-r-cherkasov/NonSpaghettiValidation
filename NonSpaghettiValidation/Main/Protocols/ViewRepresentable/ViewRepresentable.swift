//
//  ViewRepresentable.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 10.06.2022.
//

import UIKit

// TODO: Просочился UIKit :( но боюсь, другой способ держать цвет будет не оч

protocol ViewRepresentable: AnyObject {
    
    var shape: ShapeType { get set }
    var color: UIColor { get set }
    var nickname: String { get set }
    var isWantGoTrip: Bool { get set }
    
}
