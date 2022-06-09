//
//  PupilProtocol.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import UIKit

// TODO: Просочился UIKit :( но боюсь, другой способ держать цвет будет не оч

protocol PupilProtocol: AnyObject {
    
    var delegate: PupilDelegate? { get set }
    var shape: ShapeType { get set }
    var color: UIColor { get set }
    var nickname: String { get set }
    var isWantGoTrip: Bool { get set }
    
    init()
    init(delegate: PupilDelegate?)
    
}

extension PupilProtocol {
    
    init(delegate: PupilDelegate? = nil) {
        self.init()
        self.delegate = delegate
    }
    
}

protocol PupilDelegate: AnyObject {
    
    var pupilList: [PupilProtocol] { get set }
    
}
