//
//  VotersRule.swift
//  Referee
//
//  Created by Ilya Cherkasov on 25.07.2022.
//

public struct VotersRules: Voters {
    
    public var voters: [Voting]
    
    public init(_ rule: Rule, @VotersSetBuilder voters: () -> Voters) {
        self.voters = voters().voters
        self.voters.forEach {
            $0.validator.rules.append(rule)
        }
    }
    
    public init(_ rules: [Rule] = [], @VotersSetBuilder voters: () -> Voters) {
        self.voters = voters().voters
        self.voters.forEach {
            $0.validator.rules += rules
        }
    }
    
}

@resultBuilder public struct VotersRulesBuilder {
    
    public static func buildBlock(_ components: Voters...) -> Voters {
        VotersDTO(voters: components.flatMap { $0.voters })
    }
    
}
