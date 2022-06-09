//
//  Validable.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import Foundation

protocol Validable {
    
    func getOwnRules() -> [ValidationRuleProtocol]
    
}

extension Validable {
    func getOwnRules() -> [ValidationRuleProtocol] {
        []
    }
}
