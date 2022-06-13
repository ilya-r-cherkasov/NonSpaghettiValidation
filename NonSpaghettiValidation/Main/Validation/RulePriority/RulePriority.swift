//
//  RulePriority.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 09.06.2022.
//

import Foundation

struct RulePriority {
    
    // MARK: - Properties

    var priority: Int
    
    // MARK: - Initialization
    
    init(_ priority: Int) {
        self.priority = priority
    }
    
}

extension RulePriority {
    
    static let low = RulePriority(250)
    static let medium = RulePriority(500)
    static let hight = RulePriority(750)
    
}
