//
//  MainViewInput.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 07.06.2022.
//

protocol MainViewInput: AnyObject {
    
    func configure(withFileds fields: [InputCellModel])
    
}
