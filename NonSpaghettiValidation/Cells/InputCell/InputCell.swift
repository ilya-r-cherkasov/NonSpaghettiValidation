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
    
    private lazy var textField: UITextField = {
        let textField = UITextField.make(forCell: self)
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }()
    
    private var model: InputCellModel? {
        didSet {
            textField.text = model?.title
        }
    }
    
    // MARK: - ConfigurableItem
    
    func configure(with model: InputCellModel) {
        self.model = model
    }
    
}

// MARK: - Actions

extension InputCell {
    
    @objc
    func textFieldDidChange(_ textField: UITextField) {
        model?.valueChanged?(textField.text ?? "")
    }
    
}

// MARK: - UITextField

private extension UITextField {
    
    static func make(forCell cell: UITableViewCell) -> UITextField {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        cell.contentView.addSubview(textField)
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(
                equalTo: cell.contentView.safeAreaLayoutGuide.topAnchor,
                constant: 5
            ),
            textField.leadingAnchor.constraint(
                equalTo: cell.contentView.safeAreaLayoutGuide.leadingAnchor,
                constant: 5
            ),
            textField.trailingAnchor.constraint(
                equalTo: cell.contentView.safeAreaLayoutGuide.trailingAnchor,
                constant: -5
            ),
            textField.bottomAnchor.constraint(
                equalTo: cell.contentView.safeAreaLayoutGuide.bottomAnchor,
                constant: -5
            )
        ])
        return textField
    }
    
}
