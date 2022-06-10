//
//  PupilDelegate.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 09.06.2022.
//

protocol SurveyableObjectsProvider: AnyObject {
    
    var surveyableObjects: [Surveyable] { get }
    
}
