//
//  Referee.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 09.06.2022.
//

public class Referee: VotersProvider {
    
    // MARK: - Static functions
    
    public static func make(with voters: [Voting]) -> Referee {
        Referee(voters: voters)
            .configure()
    }
    
    // MARK: - Initialization
    
    private init(voters: [Voting]) {
        self.voters = voters
    }
    
    // MARK: - Internal properties
    
    // TODO: тут лучше Set, но надо требовать Hashable
    private(set) public var voters: [Voting]
    
    // MARK: - Private properties
    
    private var allRules: [Rule] {
        voters
            .map { $0.validator.rules }
            .flatMap { $0 }
    }
    
    // MARK: - Methods
    
    public func startVoting() -> [Conflict] {
        let conficts = voters.reduce([Conflict]()) {
            $0
                + $1.checkYourself()
                + $1.startOneTwoOnes()
                + $1.startRoundTable()
        }
        return tryResolve(conficts)
    }
        
}

// MARK: - Private functions

private extension Referee {
    
    
    ///Configure all voters
    func configure() -> Referee {
        voters.forEach { $0.votersProvider = self }
        return self
    }
    
    /// Проверяем, что если выполнены правила с тем же тегом, но приоритетом выше
    /// Конфликт, если таких правил нет
    func tryResolve(_ conficts: [Conflict]) -> [Conflict] {
        conficts.compactMap { conflict in
            let hightPriorityRules = allRules
                .filter { $0.tag == conflict.tag }
                .filter { $0.priority > conflict.priority }
            return hightPriorityRules.isEmpty ? conflict : nil
        }
    }
    
}
