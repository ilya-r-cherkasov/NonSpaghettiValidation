//
//  InputCellModel.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 07.06.2022.
//

import UIKit

struct InputCellModel {
    
    var nickname: String
    var color: UIColor
    
    var nicknameChanged: ((String) -> ())?
    var goTripStatusChanged: ((Bool) -> ())?
    
}
