//
//  InputCellModel.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 07.06.2022.
//

import UIKit

struct InputCellModel {
    
    var title: String
    var color: UIColor
    
    var valueChanged: ((String) -> ())?
    
}
