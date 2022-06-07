//
//  MainViewController.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 07.06.2022.
//

import UIKit

class MainViewController: UIViewController, MainViewInput {
    
    // MARK: - Internal properties
    
    var output: MainViewOutput?
    
    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }

}

