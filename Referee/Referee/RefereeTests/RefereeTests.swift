//
//  RefereeTests.swift
//  RefereeTests
//
//  Created by Ilya Cherkasov on 25.07.2022.
//

import XCTest
@testable import Referee

class TestVoter: Voting {
    
    var votersProvider: VotersProvider?
    var validator: Validator = Validator()
    
}

class RefereeTests: XCTestCase, Refereing {
    
    lazy var votersBody: Voters = {
        VotersGroup {
            TestVoter()
        }
    }()
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
    }

    func testExample() throws {
        
    }

    func testPerformanceExample() throws {
        self.measure {
            
        }
    }

}
