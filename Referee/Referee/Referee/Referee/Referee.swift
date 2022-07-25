//
//  Referee.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 09.06.2022.
//

public class MainReferee: SurveyableObjectsProvider {
    
    // MARK: - Static functions
    
    public static func make(with surveyableObjects: [Surveyable]) -> MainReferee {
        MainReferee(surveyableObjects: surveyableObjects)
            .configure()
    }
    
    // MARK: - Initialization
    
    private init(surveyableObjects: [Surveyable]) {
        self.surveyableObjects = surveyableObjects
    }
    
    // MARK: - Internal properties
    
    // TODO: тут лучше Set, но надо требовать Hashable
    private(set) public var surveyableObjects: [Surveyable]
    
    var allRules: [Rule] {
        surveyableObjects
            .map { $0.validator.rules }
            .flatMap { $0 }
    }
    
    // MARK: - Methods
    
    public func startSurvey() -> [Conflict] {
        let rawConflicts = surveyableObjects.reduce([Conflict]()) {
            $0 + $1.checkYourself() + $1.askOther()
        }
        return tryResolve(conficts: rawConflicts)
    }
        
}

// MARK: - Private functions

private extension MainReferee {
    
    
    ///Подписываем всех участников под делегат
    func configure() -> MainReferee {
        surveyableObjects.forEach { $0.surveyableObjectsProvider = self }
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
