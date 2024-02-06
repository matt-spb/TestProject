//
//
//  NameScreenViewController.swift
//  TestProject
//
//  Created by Матвей Федышин on 01.02.2024.
//
//

import UIKit

protocol NameScreenDisplayLogic: AnyObject {
    
}

final class NameScreenViewController: UIViewController {
    
    var presenter: NameScreenPresenterLogic?
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.returnKeyType = UIReturnKeyType.done
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.clearButtonMode = UITextField.ViewMode.whileEditing;
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        textField.placeholder = "Enter your name"
        textField.keyboardType = .alphabet
        textField.delegate = self
        return textField
    }()
    
    private lazy var findButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 20)
        configuration.attributedTitle = AttributedString("Find Out", attributes: container)
        configuration.buttonSize = .large
        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addAction(
            UIAction { [weak self] _ in
                if let name = self?.nameTextField.text, name != "" {
                    self?.presenter?.findButtonTapped(with: name)
                }
            },
            for: .touchUpInside
        )
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setupLayout()
        
        view.backgroundColor = #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nameTextField.text = ""
    }
    
    private func addViews() {
        view.addSubview(nameTextField)
        view.addSubview(findButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            findButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            findButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.bottomAnchor.constraint(equalTo: findButton.topAnchor, constant: -40)
        ])
    }
}

extension NameScreenViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        do {
            let regex = try NSRegularExpression(pattern: ".*[^A-Za-z ].*", options: [])
            if regex.firstMatch(in: string, options: [], range: NSMakeRange(0, string.count)) != nil {
                return false
            }
        }
        catch {
            print("ERROR")
        }
        return true
    }
}

// MARK: - Display Logic

extension NameScreenViewController: NameScreenDisplayLogic {
    
}
