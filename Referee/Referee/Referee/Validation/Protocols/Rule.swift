//
//  ValidationRuleProtocol.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 09.06.2022.
//

public protocol Rule: AnyObject {
    
    var isValid: Bool { get }
    var priority: RulePriority { get set }
    var tag: String { get set }
    var currentObject: Surveyable? { get set }
        
}

public final class DefaultRule: Rule {
    
    // MARK: - Properties
    
    public var priority: RulePriority
    public var tag: String
    weak public var currentObject: Surveyable?
    
    public var isValid: Bool {
        guard let currentObject = currentObject else {
            return false
        }
        return rule(currentObject)
    }
    
    // MARK: - Private properties
    
    public var rule: ((Surveyable) -> Bool)
    
    // MARK: - Initialization
    
    public init(priority: RulePriority, tag: String, rule: @escaping ((Surveyable) -> Bool)) {
        self.rule = rule
        self.priority = priority
        self.tag = tag
    }
    
}
