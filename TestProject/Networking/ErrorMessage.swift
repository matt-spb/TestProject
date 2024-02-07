//
//  ErrorMessage.swift
//  TestProject
//
//  Created by Матвей Федышин on 13.01.2024.
//

import Foundation

enum ErrorMessage: String, Error {
    case invalidData        = "Invalid Data"
    case unableToComplete   = "Unabale to complete request"
    case unableToDecode     = "Decoding error"
    case invalidResponse    = "Invalid response from the server. Please try again"
}
