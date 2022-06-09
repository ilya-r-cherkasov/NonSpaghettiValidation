//
//  PupilDelegate.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 09.06.2022.
//

protocol PupilListProvider: AnyObject {
    
    var pupilList: [Pupil] { get }
    
}
