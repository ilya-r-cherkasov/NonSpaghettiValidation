//
//  ValidationRuleProtocol.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 09.06.2022.
//

protocol ValidationRuleProtocol {
    
    var isValid: Bool { get set }
    var priority: RulePriority { get set }
    
}
