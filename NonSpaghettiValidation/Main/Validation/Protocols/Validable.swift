//
//  Validable.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import Foundation

protocol Validable {
    
    var validator: Validator { get }
    
}

extension Validable {
        
    var validator: Validator {
        Validator(rules: [])
    }
    
}
