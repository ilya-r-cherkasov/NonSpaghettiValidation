//
//  PupilProtocol.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import UIKit

// TODO: Просочился UIKit :( но боюсь, другой способ держать цвет будет не оч

protocol Pupil: AnyObject {
    
    var pupilListProvider: PupilListProvider? { get set }
    var shape: ShapeType { get set }
    var color: UIColor { get set }
    var nickname: String { get set }
    var isWantGoTrip: Bool { get set }
    
    func checkYourself() -> Bool
    func askOther() -> Bool
    func haveNoConflict(with: Pupil) -> Bool
    
}

extension Pupil {
    
    func checkYourself() -> Bool {
        true
    }
    
    func askOther() -> Bool {
        let other = pupilListProvider?.pupilList.filter { !($0 is Self) } ?? []
        return other.reduce(true) {
            $0 && $1.haveNoConflict(with: self)
        }
    }
    
    func haveNoConflict(with pupil: Pupil) -> Bool {
        true
    }
    
}
