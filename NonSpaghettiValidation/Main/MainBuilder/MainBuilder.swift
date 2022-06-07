//
//  MainBuilder.swift
//  NonSpaghettiValidation
//
//  Created by Ilya Cherkasov on 07.06.2022.
//

import Foundation
import UIKit

final class MainBuilder {
    
    static func build() -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter()
        
        view.output = presenter
        presenter.view = view
        
        return view
    }
    
}
