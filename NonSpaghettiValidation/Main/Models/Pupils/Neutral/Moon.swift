//
//  Moon.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 08.06.2022.
//

import UIKit
import Referee

final class Moon: Pupil {
    
    var validator: Validator {
        Validator(rules: [
            DefaultRule(
                priority: .medium,
                tag: RuleTagger.starShouldBeInTrip.rawValue
            ) { [weak self] pupil in
                guard pupil is Star,
                      let pupil = pupil as? ViewRepresentable,
                      let self = self else {
                    return true
                }
                return pupil.isWantGoTrip && self.isWantGoTrip
            }
        ])
    }
    
    weak var surveyableObjectsProvider: SurveyableObjectsProvider?
    var shape: ShapeType = .neutral
    var color: UIColor = .white
    var nickname: String = "Moon"
    var isWantGoTrip: Bool = false
    
}
