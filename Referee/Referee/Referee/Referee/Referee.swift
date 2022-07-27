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
    
    var allRules: [Rule] {
        voters
            .map { $0.validator.rules }
            .flatMap { $0 }
    }
    
    // MARK: - Methods
    
    public func startVoting() -> [Conflict] {
        let rawConflicts = voters.reduce([Conflict]()) {
            $0
                + $1.checkYourself()
                + $1.startOneTwoOnes()
                + $1.startRoundTable()
        }
        return tryResolve(conficts: rawConflicts)
    }
        
}

// MARK: - Private functions

private extension Referee {
    
    
    ///Подписываем всех участников под делегат
    func configure() -> Referee {
        voters.forEach { $0.votersProvider = self }
        return self
    }
    
    /// Проверяем, что если выполнены правила с тем же тегом, но приоритетом выше
    /// Конфликт, если таких правил нет
    /// Скорее всего может быть баг, могут намешаться конфликты с одним тегом и разным приоритетом
    func tryResolve(conficts: [Conflict]) -> [Conflict] {
        conficts.compactMap { conflict in
            let filteredRules = allRules
                .filter { $0.tag == conflict.tag }
                .filter { $0.priority > conflict.priority }
            return filteredRules.isEmpty ? conflict : nil
        }
    }
    
}
