//
//  Teacher.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 09.06.2022.
//

final class Teacher: PupilListProvider {
    
    // MARK: - Static functions
    
    static func make(with pupilList: [Pupil]) -> Teacher {
        Teacher(pupilList: pupilList)
            .configure()
    }
    
    // MARK: - Initialization
    
    private init(pupilList: [Pupil]) {
        self.pupilList = pupilList
    }
    
    // MARK: - Internal properties
    
    // TODO: тут лучше Set, но надо требовать Hashable
    private(set) var pupilList: [Pupil]
    
    // MARK: - Methods
    
    func startSurvey() -> Bool {
        pupilList.reduce(true) {
            $0 && $1.checkYourself() && $1.askOther()
        }
    }
        
}

// MARK: - Private functions

private extension Teacher {
    
    func configure() -> Teacher {
        pupilList.forEach { $0.pupilListProvider = self }
        return self
    }
    
}
