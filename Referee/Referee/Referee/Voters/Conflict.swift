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

public struct DummyConflict: Conflict {
    
    public var tag: String
    public var priority: RulePriority
    
    public init(tag: String, priority: RulePriority) {
        self.tag = tag
        self.priority = priority
    }
    
}
