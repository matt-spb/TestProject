//
//  Person.swift
//  TestProject
//
//  Created by Матвей Федышин on 18.01.2024.
//

import Foundation

struct Person: Decodable {
    let age: Int?
    let gender: String?
    let country: [Country]?
}

// MARK: - Country
struct Country: Codable {
    let country: String

    enum CodingKeys: String, CodingKey {
        case country = "country_id"
    }
}

extension Person {
    static let rusLettersGender = [
        "male": "Мужской",
        "female": "Женский"
    ]
}
