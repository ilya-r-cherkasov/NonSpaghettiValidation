//
//  Validable.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import Foundation

protocol Validable {
    
    func getOwnRules() -> [Rule] 
    
}

extension Validable {
    func getOwnRules() -> [Rule] {
        []
    }
}

struct Rule {
    
}
