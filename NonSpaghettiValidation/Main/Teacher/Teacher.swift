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
    
    // MARK: - Methods
    
    func startSurvey() -> [Conflict] {
        surveyableObjects.reduce([Conflict]()) {
            $0 + $1.checkYourself() + $1.askOther()
        }
    }
        
}

// MARK: - Private functions

private extension Referee {
    
    func configure() -> Referee {
        surveyableObjects.forEach { $0.surveyableObjectsProvider = self }
        return self
    }
    
}
