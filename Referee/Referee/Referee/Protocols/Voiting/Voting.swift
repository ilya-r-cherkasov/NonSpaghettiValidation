//
//  Voting.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 10.06.2022.
//

public protocol Voting: AnyObject, Validable {
    
    var votersProvider: VotersProvider? { get set }
    
    func checkYourself() -> [Conflict]
    func askOther() -> [Conflict]
    
}

public extension Voting {
    
    func checkYourself() -> [Conflict] {
        []
    }
    
    func askOther() -> [Conflict] {
        let other = votersProvider?.voters.filter { !($0 === self) } ?? []
        return other.reduce([Conflict]()) {
            $0 + $1.validator.startOneTwoOne(with: self)
        }
    }
    
}
