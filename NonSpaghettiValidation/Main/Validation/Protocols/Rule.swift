//
//  ValidationRuleProtocol.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 09.06.2022.
//

protocol Rule: AnyObject {
    
    var isValid: Bool { get }
    var priority: RulePriority { get set }
    var tag: String { get set }
    var currentObject: Surveyable? { get set }
        
}

final class DefaultRule: Rule {
    
    // MARK: - Properties
    
    var priority: RulePriority
    var tag: String
    weak var currentObject: Surveyable?
    
    var isValid: Bool {
        guard let currentObject = currentObject else {
            return false
        }
        return rule(currentObject)
    }
    
    // MARK: - Private properties
    
    var rule: ((Surveyable) -> Bool)
    
    // MARK: - Initialization
    
    init(priority: RulePriority, tag: String, rule: @escaping ((Surveyable) -> Bool)) {
        self.rule = rule
        self.priority = priority
        self.tag = tag
    }
    
}
