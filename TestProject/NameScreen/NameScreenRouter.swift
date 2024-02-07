//
//  
//  NameScreenRouter.swift
//  TestProject
//
//  Created by Матвей Федышин on 01.02.2024.
//
//

import UIKit

protocol NameScreenRoutingLogic {
    func showInfoScreen(with data: [String: String])
}

final class NameScreenRouter: NameScreenRoutingLogic {
    
    // MARK: - Public Properties
    
    weak var parentController: UIViewController?
    weak var viewController: NameScreenViewController?

    // MARK: - Navigation
    
    func showInfoScreen(with data: [String: String]) {
        let infoViewController = Assembly().makeInfoViewController(with: data)
        viewController?.navigationController?.pushViewController(infoViewController, animated: true)
    }
}
