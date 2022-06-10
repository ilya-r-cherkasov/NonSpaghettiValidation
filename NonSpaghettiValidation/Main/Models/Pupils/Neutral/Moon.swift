//
//  Moon.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import UIKit

final class Moon: Pupil {    
    
    weak var surveyableObjectsProvider: SurveyableObjectsProvider?
    var shape: ShapeType = .neutral
    var color: UIColor = .white
    var nickname: String = "Moon"
    var isWantGoTrip: Bool = false
    
    func haveNoConflict(with pupil: Pupil) -> Bool {
        pupil is Star ? pupil.isWantGoTrip != true : true
    }
    
}
