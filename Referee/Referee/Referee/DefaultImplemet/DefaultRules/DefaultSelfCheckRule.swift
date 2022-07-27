//
//  DefaultSelfCheckRule.swift
//  Referee
//
//  Created by Ilya Cherkasov on 27.07.2022.
//

final class DefaultSelfCheckRule: SelfCheckRule {
    
    // MARK: - Properties

    var priority: RulePriority
    var tag: String
    var voiter: Voting?
    
    public var isValid: Bool {
        guard let voiter = voiter else {
            return false
        }
        return rule(voiter)
    }
    
    // MARK: - Private properties
    
    private var rule: ((Voting) -> Bool)
    
    // MARK: - Initialization
    
    public init(priority: RulePriority, tag: String, rule: @escaping ((Voting) -> Bool)) {
        self.rule = rule
        self.priority = priority
        self.tag = tag
    }
    
}
