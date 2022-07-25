//
//  Validable.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import Foundation

public protocol Validable {
    
    var validator: Validator { get set }
    
}

public extension Validable {
        
    var validator: Validator {
        Validator(rules: [])
    }
    
}
