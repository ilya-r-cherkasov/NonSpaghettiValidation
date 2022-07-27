//
//  RefereeWrapper.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 27.07.2022.
//

import Referee

final class RefereeWrapper: Refereing {
    
    let nonEmptyRule = DefaultOneTwoOneRule(priority: .high, tag: "firstRule") { voter in
        guard let pupil = voter as? Moon else {
            return true
        }
        return !pupil.nickname.isEmpty
    }
    
    let oneCharRule = DefaultOneTwoOneRule(priority: .high, tag: "oneCharRule") { voter in
        guard let pupil = voter as? Moon else {
            return true
        }
        return pupil.nickname.count != 1
    }
    
    let twoCharRule = DefaultOneTwoOneRule(priority: .high, tag: "twoCharRule") { voter in
        guard let pupil = voter as? Moon else {
            return true
        }
        return pupil.nickname.count != 2
    }
    
    let doNotConsistW = DefaultSelfCheckRule(priority: .high, tag: "doNotConsistW") { voter in
        guard let pupil = voter as? Pupil else {
            return true
        }
        return !pupil.nickname.contains("w")
    }
    
    let roundTable = DefaultRoundTableRule(priority: .high, tag: "roundTable") { voters in
        return false
    }
    
    private(set) lazy var votersBody: Voters = {
        
        return VotersGroup {
            VotersGroup {
                Mediator()
                Star()
                Moon()
            }
            VotersRules([nonEmptyRule, doNotConsistW, roundTable]) {
                VotersGroup {
                    AirBalloon()
                    Ball()
                }
                VotersRules(oneCharRule) {
                    Needle()
                    Knife()
                }
                VotersRules(twoCharRule) {
                    HeliumBalloon()
                    Trident()
                }
            }
        }
    }()

}
