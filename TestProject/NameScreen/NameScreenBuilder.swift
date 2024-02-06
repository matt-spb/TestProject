//
//  
//  NameScreenBuilder.swift
//  TestProject
//
//  Created by Матвей Федышин on 01.02.2024.
//
//

import UIKit

protocol NameScreenBuildingLogic: AnyObject {
    func makeScene(parent: UIViewController?) -> NameScreenViewController
}

final class NameScreenBuilder: NameScreenBuildingLogic {
    
    // MARK: - Public Methods
    init() {}
    
    func makeScene(parent: UIViewController? = nil) -> NameScreenViewController {
        let viewController = NameScreenViewController()
        
        let interactor = NameScreenInteractor()
        let presenter = NameScreenPresenter()
        let router = NameScreenRouter()
        
        interactor.presenter = presenter
        
        presenter.viewController = viewController
        presenter.interactor = interactor
        presenter.router = router
        
        router.parentController = parent
        router.viewController = viewController
        
        viewController.presenter = presenter
     
        return viewController
    }
}
