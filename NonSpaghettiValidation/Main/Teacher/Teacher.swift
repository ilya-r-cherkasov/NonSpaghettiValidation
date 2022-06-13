//
//  Referee.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 09.06.2022.
//

typealias Teacher = Referee

final class Referee: SurveyableObjectsProvider {
    
    // MARK: - Static functions
    
    static func make(with surveyableObjects: [Surveyable]) -> Referee {
        Referee(surveyableObjects: surveyableObjects)
            .configure()
    }
    
    // MARK: - Initialization
    
    private init(surveyableObjects: [Surveyable]) {
        self.surveyableObjects = surveyableObjects
    }
    
    // MARK: - Internal properties
    
    // TODO: тут лучше Set, но надо требовать Hashable
    private(set) var surveyableObjects: [Surveyable]
    
    var allRules: [Rule] {
        surveyableObjects
            .map { $0.validator.rules }
            .flatMap { $0 }
    }
    
    // MARK: - Methods
    
    func startSurvey() -> [Conflict] {
        let rawConflicts = surveyableObjects.reduce([Conflict]()) {
            $0 + $1.checkYourself() + $1.askOther()
        }
        return tryResolve(conficts: rawConflicts)
    }
        
}

// MARK: - Private functions

private extension Referee {
    
    func configure() -> Referee {
        surveyableObjects.forEach { $0.surveyableObjectsProvider = self }
        return self
    }
    
    func tryResolve(conficts: [Conflict]) -> [Conflict] {
        // Проверяем, что если выполнены правила с тем же тегом, но приоритетом выше
        // Конфликт, если таких правил нет
        // Скорее всего может быть баг, могут намешаться конфликты с одним тегом и разным приоритетом
        conficts.compactMap { conflict in
            let filteredRules = allRules
                .filter { $0.tag == conflict.tag }
                .filter { $0.priority > conflict.priority }
            return filteredRules.isEmpty ? conflict : nil
        }
    }
    
}
