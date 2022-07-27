//
//  Conflict.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 11.06.2022.
//

public protocol Conflict {
    
    var tag: String { get set }
    var priority: RulePriority { get set }
        
}
