//
//  InputCell.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 07.06.2022.
//

import UIKit
import ReactiveDataDisplayManager

final class InputCell: UITableViewCell, ConfigurableItem {
    
    // MARK: - Private methods
    
    private lazy var textFiled = UITextField.make(parentView: contentView)
    
    // MARK: - ConfigurableItem
    
    func configure(with model: InputCellModel) {
        textFiled.text = model.title
    }
    
}

private extension UITextField {
    
    static func make(parentView: UIView) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(
                equalTo: parentView.safeAreaLayoutGuide.topAnchor,
                constant: 5
            ),
            textField.leadingAnchor.constraint(
                equalTo: parentView.safeAreaLayoutGuide.leadingAnchor,
                constant: 5
            ),
            textField.trailingAnchor.constraint(
                equalTo: parentView.safeAreaLayoutGuide.trailingAnchor,
                constant: -5
            ),
            textField.bottomAnchor.constraint(
                equalTo: parentView.safeAreaLayoutGuide.bottomAnchor,
                constant: -5
            )
        ])
        return textField
    }
    
}
