//
//  RulePriority.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 09.06.2022.
//

import Foundation

struct RulePriority {
    
    // MARK: - Properties

    var raw: Int
    
    // MARK: - Initialization
    
    init(_ raw: Int) {
        self.raw = raw
    }
    
}

extension RulePriority {
    
    static let low = RulePriority(250)
    static let medium = RulePriority(500)
    static let hight = RulePriority(750)
    
}

extension RulePriority: Comparable {
    
    static func < (lhs: RulePriority, rhs: RulePriority) -> Bool {
        lhs.raw < rhs.raw
    }
    
}
