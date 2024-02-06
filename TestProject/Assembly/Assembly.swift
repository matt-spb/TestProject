//
//  Assembly.swift
//  TestProject
//
//  Created by Матвей Федышин on 06.02.2024.
//

import UIKit

struct Assembly {
    func makeInfoViewController(with data: [String: String]) -> InfoScreenViewController {
        return InfoScreenViewController(info: data)
    }
}

