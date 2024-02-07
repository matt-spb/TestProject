//
//  InfoViewController.swift
//  TestProject
//
//  Created by Матвей Федышин on 23.01.2024.
//

import UIKit

final class InfoScreenViewController: UIViewController {
    
    var info = [String: String]()
    
    lazy var ageTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Text.age.rawValue
        label.textAlignment = .center
        label.font = .systemFont(ofSize: Sizes.titleLabelFontSize.rawValue)
        return label
    }()
    
    lazy var ageLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: Sizes.infoLabelFontSize.rawValue)
        return label
    }()
    
    lazy var genderTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Text.gender.rawValue
        label.textAlignment = .center
        label.font = .systemFont(ofSize: Sizes.titleLabelFontSize.rawValue)
        return label
    }()
    
    lazy var genderLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: Sizes.infoLabelFontSize.rawValue)
        return label
    }()
    
    lazy var countryTitleLabel: UILabel = {
        let label = UILabel()
        label.text = Text.country.rawValue
        label.textAlignment = .center
        label.font = .systemFont(ofSize: Sizes.titleLabelFontSize.rawValue)
        return label
    }()
    
    lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: Sizes.infoLabelFontSize.rawValue)
        return label
    }()
    
    lazy var ageStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ageTitleLabel, ageLabel])
        stackView.backgroundColor = Colors.ageSection.rawValue
        stackView.axis = .vertical
        stackView.spacing = Sizes.secondaryStackViewSpacing.rawValue
        stackView.distribution = .fill
        return stackView
    }()
    
    lazy var genderStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [genderTitleLabel, genderLabel])
        stackView.backgroundColor = Colors.genderSection.rawValue
        stackView.axis = .vertical
        stackView.spacing = Sizes.secondaryStackViewSpacing.rawValue
        stackView.distribution = .fill
        return stackView
    }()
    
    lazy var countryStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [countryTitleLabel, countryLabel])
        stackView.backgroundColor = Colors.countrySection.rawValue
        stackView.axis = .vertical
        stackView.spacing = Sizes.secondaryStackViewSpacing.rawValue
        stackView.distribution = .fill
        return stackView
    }()
    
    lazy var mainStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ageStackView, genderStackView, countryStackView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = Sizes.mainStackViewSpacing.rawValue
        stackView.distribution = .fill
        return stackView
    }()
    
    init(info: [String : String]) {
        self.info = info
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.viewBackgroundColor.rawValue
        addViews()
        setupLayout()
        fillData()
    }
    
    private func fillData() {
        ageLabel.text = info[Text.age.rawValue] ?? Text.invalidAge.rawValue
        genderLabel.text = info[Text.gender.rawValue] ?? Text.invalidGender.rawValue
        countryLabel.text = info[Text.country.rawValue] ?? Text.invalidCountry.rawValue
    }
    
    private func addViews() {
        view.addSubview(mainStackView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainStackView.widthAnchor.constraint(equalToConstant: view.frame.width - Sizes.widthPadding.rawValue)
        ])
    }
}

// MARK: - Constants

extension InfoScreenViewController {
    private enum Sizes: CGFloat {
        case mainStackViewSpacing = 15
        case secondaryStackViewSpacing = 10
        case titleLabelFontSize = 14
        case infoLabelFontSize = 24
        case widthPadding = 40
    }
    
    enum Text: String {
        case age = "Возраст"
        case gender = "Пол"
        case country = "Страна"
        
        case invalidAge = "Не удалось определить возраст"
        case invalidGender = "Не удалось определить пол"
        case invalidCountry = "Не удалось определить страну"
    }
    
    enum Colors {
        case ageSection
        case genderSection
        case countrySection
        case viewBackgroundColor
    }
}

extension InfoScreenViewController.Colors: RawRepresentable {
    typealias RawValue = UIColor

    init?(rawValue: RawValue) {
        switch rawValue {
        case #colorLiteral(red: 0.1808482409, green: 0.7649639845, blue: 0.6246445775, alpha: 1): self = .ageSection
        case #colorLiteral(red: 0.1510272026, green: 0.6597955823, blue: 0.7669206262, alpha: 1): self = .genderSection
        case #colorLiteral(red: 0.7707391977, green: 0.669782877, blue: 0.662547946, alpha: 1): self = .countrySection
        case #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1): self = .viewBackgroundColor
        default: return nil
        }
    }

    var rawValue: RawValue {
        switch self {
        case .ageSection: return #colorLiteral(red: 0.1808482409, green: 0.7649639845, blue: 0.6246445775, alpha: 1)
        case .genderSection: return #colorLiteral(red: 0.1510272026, green: 0.6597955823, blue: 0.7669206262, alpha: 1)
        case .countrySection: return #colorLiteral(red: 0.7707391977, green: 0.669782877, blue: 0.662547946, alpha: 1)
        case .viewBackgroundColor: return #colorLiteral(red: 0.7540688515, green: 0.7540867925, blue: 0.7540771365, alpha: 1)
        }
    }
}
