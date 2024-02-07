//
//  
//  NameScreenPresenter.swift
//  TestProject
//
//  Created by Матвей Федышин on 01.02.2024.
//
//

import Foundation

protocol NameScreenPresenterLogic: AnyObject {
    func findButtonTapped(with name: String)
}

protocol NameScreenInteractorOutputLogic: AnyObject {
    func showInfoScreen(with data: [String: String])
}

final class NameScreenPresenter: NameScreenPresenterLogic {
    
    weak var viewController: NameScreenDisplayLogic?
    var interactor: NameScreenInteractorInputLogic?
    var router: NameScreenRoutingLogic?
    
    // MARK: - Presentation Logic
    
    func findButtonTapped(with name: String) {
        interactor?.makeNetworkCall(with: name)
    }
}

// MARK: - NameScreenInteractorOutputLogic

extension NameScreenPresenter: NameScreenInteractorOutputLogic {
    func showInfoScreen(with data: [String: String]) {
        router?.showInfoScreen(with: data)
    }
}
