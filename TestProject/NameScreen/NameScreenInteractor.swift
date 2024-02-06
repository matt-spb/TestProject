//
//  
//  NameScreenInteractor.swift
//  TestProject
//
//  Created by Матвей Федышин on 01.02.2024.
//
//

import Foundation

protocol NameScreenInteractorInputLogic {
    func makeNetworkCall(with name: String)
}

final class NameScreenInteractor: NameScreenInteractorInputLogic {
    
    weak var presenter: NameScreenInteractorOutputLogic?
    let networkManager: NetworkServiceProtocol = NetworkManager()
    
    // MARK: - Business Logic
    
    func makeNetworkCall(with name: String) {
        networkManager.getData(for: name, completion: { [weak self] result in
            self?.presenter?.showInfoScreen(with: result)
        })
    }
}
