//
//  DefaultConflict.swift
//  Referee
//
//  Created by Ilya Cherkasov on 27.07.2022.
//

public struct DefaultConflict: Conflict {
    
    public var tag: String
    public var priority: RulePriority
    
    public init(tag: String, priority: RulePriority) {
        self.tag = tag
        self.priority = priority
    }
    
}
