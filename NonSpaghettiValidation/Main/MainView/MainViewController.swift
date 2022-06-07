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
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureTableView()
        configureAdapter()
    }

}

// MARK: - Adapter

private extension MainViewController {
    
    func configureAdapter() {
        adapter.addCellGenerator(makeInputGenerator())
    }
    
    func makeInputGenerator() -> TableCellGenerator {
        BaseCellGenerator<InputCell>(
            with: InputCellModel(title: "Hello") { value in
                
            },
            registerType: .class
        )
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
    
}
