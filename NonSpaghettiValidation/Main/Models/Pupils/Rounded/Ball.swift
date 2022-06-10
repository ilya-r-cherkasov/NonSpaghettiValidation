//
//  Ball.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import UIKit

final class Ball: Pupil {
    
    weak var surveyableObjectsProvider: SurveyableObjectsProvider?
    var shape: ShapeType = .rounded
    var color: UIColor = .white
    var nickname: String = "Ball"
    var isWantGoTrip: Bool = false
    
}
