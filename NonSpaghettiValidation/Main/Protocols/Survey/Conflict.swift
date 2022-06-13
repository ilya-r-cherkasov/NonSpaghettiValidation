//
//  Conflict.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 11.06.2022.
//

protocol Conflict {
    var tag: String { get set }
    var priority: RulePriority { get set }
}

struct DummyConflict: Conflict {
    
    var tag: String
    var priority: RulePriority
    
}
