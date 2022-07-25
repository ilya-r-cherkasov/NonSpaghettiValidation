//
//  Knife.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import UIKit
import Referee

final class Knife: Pupil {
    
    weak var surveyableObjectsProvider: SurveyableObjectsProvider?
    var shape: ShapeType = .sharp
    var color: UIColor = .green
    var nickname: String = "Knife"
    var isWantGoTrip: Bool = false
    
}
