//
//  InputCell.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 07.06.2022.
//

import UIKit
import ReactiveDataDisplayManager

final class InputCell: UITableViewCell, ConfigurableItem {
    
    // MARK: - Nested types
    
    private enum Constants {
        static let defaultInset: CGFloat = 15
    }
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        contentView.addSubview(textField)
        contentView.addSubview(switcher)
        configureTextFieldConstraints()
        configureSwitcherConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private methods
    
    private lazy var textField: UITextField = {
        let textField = UITextField.make()
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }()
    
    private lazy var switcher: UISwitch = {
        let switcher = UISwitch.make()
        switcher.addTarget(self, action: #selector(swicherDidChanged(_:)), for: .valueChanged)
        return switcher
    }()
    
    private var model: InputCellModel? {
        didSet {
            textField.text = model?.nickname
            backgroundColor = model?.color
        }
    }
    
    // MARK: - ConfigurableItem
    
    func configure(with model: InputCellModel) {
        self.model = model
    }
    
}

// MARK: - Layout

private extension InputCell {
    
    func configureTextFieldConstraints() {
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(
                equalTo: contentView.safeAreaLayoutGuide.topAnchor,
                constant: Constants.defaultInset
            ),
            textField.leadingAnchor.constraint(
                equalTo: contentView.safeAreaLayoutGuide.leadingAnchor,
                constant: Constants.defaultInset
            ),
            textField.trailingAnchor.constraint(
                equalTo: contentView.safeAreaLayoutGuide.trailingAnchor,
                constant: -Constants.defaultInset
            ),
            textField.bottomAnchor.constraint(
                equalTo: contentView.safeAreaLayoutGuide.bottomAnchor,
                constant: -Constants.defaultInset
            )
        ])
    }
    
    func configureSwitcherConstraints() {
        NSLayoutConstraint.activate([
            switcher.centerYAnchor.constraint(equalTo: textField.centerYAnchor),
            switcher.trailingAnchor.constraint(
                equalTo: contentView.safeAreaLayoutGuide.trailingAnchor,
                constant: -Constants.defaultInset
            ),
        ])
    }
    
}

// MARK: - Actions

extension InputCell {
    
    @objc
    func textFieldDidChange(_ textField: UITextField) {
        model?.nicknameChanged?(textField.text ?? "")
    }
    
    @objc
    func swicherDidChanged(_ switcher: UISwitch) {
        model?.goTripStatusChanged?(switcher.isOn)
    }
    
}

// MARK: - UITextField

private extension UITextField {
    
    static func make() -> UITextField {
        let textField = UITextField()
        textField.backgroundColor = .clear
        textField.font = UIFont.systemFont(ofSize: 24)
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }
    
}

private extension UISwitch {
    
    static func make() -> UISwitch {
        let switcher = UISwitch()
        switcher.translatesAutoresizingMaskIntoConstraints = false
        return switcher
    }
    
}
