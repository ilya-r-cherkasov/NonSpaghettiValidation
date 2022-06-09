//
//  MainViewController.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 07.06.2022.
//

import UIKit
import ReactiveDataDisplayManager

class MainViewController: UIViewController, MainViewInput {
    
    
    // MARK: - Internal properties
    
    var output: MainViewOutput?
    
    // MARK: - Private properties
    
    private lazy var tableView = UITableView()
    private lazy var adapter = tableView.rddm.baseBuilder.build()
    private var nextButton = UIButton()
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureTableView()
        configureNextButton()
        output?.viewDidLoad()
    }
    
    func configure(withFileds fields: [InputCellModel]) {
        // TODO: - Не ок датафлоу, сразу в презентере есть доступ к UI. Можно тут же изготовлять генераторы
        fields.forEach {
            adapter.addCellGenerator(
                BaseCellGenerator<InputCell>(
                    with: $0,
                    registerType: .class
                )
            )
        }
    }

}

// MARK: - Actions

private extension MainViewController {
    
    @objc
    func nextButtonTapped(_ button: UIButton) {
        output?.nextButtonTapped()
    }
    
}

// MARK: - UI Configuration

private extension MainViewController {
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configureNextButton() {
        view.addSubview(nextButton)
        nextButton.setTitle("Вывести лог", for: .normal)
        nextButton.setTitleColor(.blue, for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTapped(_:)), for: .touchUpInside)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
