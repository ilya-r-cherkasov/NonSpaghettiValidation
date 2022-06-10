//
//  Surveyable.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 10.06.2022.
//

protocol Surveyable: AnyObject {
    
    var surveyableObjectsProvider: SurveyableObjectsProvider? { get set }
    
    func checkYourself() -> Bool
    func askOther() -> Bool
    func haveNoConflict(with: Surveyable) -> Bool
    
}

extension Surveyable {
    
    func checkYourself() -> Bool {
        true
    }
    
    func askOther() -> Bool {
        let other = surveyableObjectsProvider?.surveyableObjects.filter { !($0 is Self) } ?? []
        return other.reduce(true) {
            $0 && $1.haveNoConflict(with: self)
        }
    }
    
    func haveNoConflict(with pupil: Surveyable) -> Bool {
        true
    }
    
}
