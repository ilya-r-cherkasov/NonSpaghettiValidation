//
//  Validator.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 09.06.2022.
//

final class Validator {
    
    // MARK: - Properties
    
    var rules = [Rule]()
    
    // MARK: - Initialization
    
    init(rules: [Rule]) {
        self.rules = rules
    }
    
    // MARK: - Functions
    
    func validate(for object: Surveyable) -> [Conflict] {
        rules.reduce([Conflict]()) {
            // TODO: Такое себе канеш сетить тут объект, но пока так
            $1.currentObject = object
            let result = $0 + ($1.isValid ? [] : [DummyConflict(tag: $1.tag, priority: $1.priority)])
            $1.currentObject = nil
            return result
        }
    }
    
}
