//
//  Validator.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 09.06.2022.
//

final class Validator {
    
    var rules = [ValidationRuleProtocol]()
    
    func validate() -> Bool {
        rules.reduce(true) { $0 && $1.isValid }
    }
    
}
