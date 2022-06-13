//
//  Surveyable.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 10.06.2022.
//

protocol Surveyable: AnyObject, Validable {
    
    var surveyableObjectsProvider: SurveyableObjectsProvider? { get set }
    
    func checkYourself() -> [Conflict]
    func askOther() -> [Conflict]
    func haveNoConflict(with pupil: Surveyable) -> [Conflict]
    
}

extension Surveyable {
    
    func checkYourself() -> [Conflict] {
        []
    }
    
    func askOther() -> [Conflict] {
        let other = surveyableObjectsProvider?.surveyableObjects.filter { !($0 is Self) } ?? []
        return other.reduce([Conflict]()) {
            $0 + $1.haveNoConflict(with: self)
        }
    }
    
    func haveNoConflict(with pupil: Surveyable) -> [Conflict] {
        validator.validate(for: pupil)
    }
    
}
