//
//  NetworkManager.swift
//  TestProject
//
//  Created by Матвей Федышин on 13.01.2024.
//

import Foundation

protocol NetworkServiceProtocol: AnyObject {
    func getData(for name: String, completion: @escaping([String: String]) -> Void)
}

final class NetworkManager: NetworkServiceProtocol {
    
    private func fetchData(url: String, completion: @escaping ((Result<Person, ErrorMessage>) -> Void)) {
        guard let url = URL(string: url) else { return }
        
        let request = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(.failure(.unableToComplete))
            }
            guard let _ = response as? HTTPURLResponse else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let info = try JSONDecoder().decode(Person.self, from: data)
                completion(.success(info))
            } catch {
                completion(.failure(.unableToDecode))
            }
        }
        dataTask.resume()
    }
    
    func getData(for name: String, completion: @escaping([String: String]) -> Void) {
        var infoDictionary = [String: String]()
        let ageInfoUrl = "https://api.agify.io/?name=" + "\(name)"
        let genderInfoUrl = "https://api.genderize.io/?name=" + "\(name)"
        let countryInfoUrl = "https://api.nationalize.io/?name=" + "\(name)"
        
        let group = DispatchGroup()
        group.enter()
        
        fetchData(url: ageInfoUrl) { result in
            switch result {
            case .success(let person):
                if let age = person.age {
                    infoDictionary[InfoScreenViewController.Text.age.rawValue] = String(age)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            group.leave()
        }
        
        group.enter()
        fetchData(url: genderInfoUrl) { result in
            switch result {
            case .success(let person):
                if let gender = person.gender {
                    infoDictionary[InfoScreenViewController.Text.gender.rawValue] = Person.rusLettersGender[gender]
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            group.leave()
        }
        
        group.enter()
        fetchData(url: countryInfoUrl) { result in
            switch result {
            case .success(let person):
                if let countries = person.country,
                    let countryID = countries.first?.country {
                    let country = CountryID.countries[countryID]
                    infoDictionary[InfoScreenViewController.Text.country.rawValue] = country
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            group.leave()
        }
        
        group.notify(queue: .main) {
            completion(infoDictionary)
        }
    }
}
