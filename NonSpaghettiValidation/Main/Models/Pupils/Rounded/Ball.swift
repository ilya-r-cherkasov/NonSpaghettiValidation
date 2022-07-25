//
//  Ball.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import UIKit
import Referee

final class Ball: Pupil {
    
    var validator: Validator {
        Validator(rules: [
            DefaultRule(
                priority: .hight,
                tag: RuleTagger.starShouldBeInTrip.rawValue
            ) { [weak self] pupil in
                guard pupil is Star,
                      let pupil = pupil as? ViewRepresentable,
                      let self = self else {
                    return true
                }
                return !pupil.isWantGoTrip && self.isWantGoTrip
            }
        ])
    }
    
    weak var surveyableObjectsProvider: SurveyableObjectsProvider?
    var shape: ShapeType = .rounded
    var color: UIColor = .white
    var nickname: String = "Ball"
    var isWantGoTrip: Bool = false
    
}
