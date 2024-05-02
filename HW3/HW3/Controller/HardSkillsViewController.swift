//
//  HardSkillsViewController.swift
//  HW3
//
//  Created by Aliia Satbakova  on 29.04.2024.
//

import UIKit

class HardSkillsViewController: UIViewController {
    
    private let mainTitleLabel = UILabel()
    
    private let experienceTitleLabel = UILabel()
    private let techStackTitleLabel = UILabel()
    private let expectationsTitleLabel = UILabel()
    
    private let experienceLabel = UILabel()
    private let techStackLabel = UILabel()
    private let expectationsLabel = UILabel()
    
    private let hardSkillsModel = HardSkills(experience: """
                                            Свой путь в IT начала осенью 2021 года со "Школы программирования 21" от Sber, где познакомилась с С, С++, Python, SQL, Linux.
                                            В школе понравилось делать приложения с UI частью: С++ и фреймворк Qt, но инструменты не зашли 🙃 Поэтому обратила внимание на iOS разработку и в 2023 году начала самостоятельно изучать Swift.
                                            """,
                                             techStack: ["Swift",
                                                         "SwiftUI",
                                                         "UIKit",
                                                         "URLSession",
                                                         "GCD",
                                                         "Cocoapods",
                                                         "Swift Package Manager",
                                                         "Git"],
                                             expectations: """
                                             Хочу восполнить пробелы, систематизировать свои знания, освоить новые инструменты.
                                             Получить советы и best practice от опытных iOS-разработчиков. И главное стать частью команды ЦФТ.
                                             """)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextData()
        setupHardSkillsView()
    }
    
    private func setupTextData() {
        mainTitleLabel.text = "Hard Skills"
        experienceTitleLabel.text = "📝 Опыт программирования"
        techStackTitleLabel.text = "🛠️ Стек"
        expectationsTitleLabel.text = "🚀 Ожидания"
        
        experienceLabel.text = hardSkillsModel.experience
        techStackLabel.text = hardSkillsModel.techStack.joined(separator: ", ")
        expectationsLabel.text = hardSkillsModel.expectations
    }
    
    private func setupHardSkillsView() {
        setupBackground()
        setupStyleLabels()
        setupLabels()
        setupLayout()
    }
    
    private func setupBackground() {
        view.backgroundColor = LabelStyle.backgroundColorVC
    }
    
    private func setupStyleLabels() {
        mainTitleLabel.font = LabelStyle.mainTitleFont
        experienceTitleLabel.font = LabelStyle.titleFont
        techStackTitleLabel.font = LabelStyle.titleFont
        expectationsTitleLabel.font = LabelStyle.titleFont
        
        experienceLabel.font = LabelStyle.contentFont
        techStackLabel.font = LabelStyle.contentFont
        expectationsLabel.font = LabelStyle.contentFont
        
        mainTitleLabel.textAlignment = .center
        experienceTitleLabel.textAlignment = .left
        techStackTitleLabel.textAlignment = .left
        expectationsTitleLabel.textAlignment = .left
        
        experienceLabel.textAlignment = .natural
        techStackLabel.textAlignment = .natural
        expectationsLabel.textAlignment = .natural
        
        experienceLabel.numberOfLines = 0
        techStackLabel.numberOfLines = 0
        expectationsLabel.numberOfLines = 0
        
        mainTitleLabel.textColor = LabelStyle.textColor
        experienceTitleLabel.textColor = LabelStyle.textColor
        techStackTitleLabel.textColor = LabelStyle.textColor
        expectationsTitleLabel.textColor = LabelStyle.textColor
        
        experienceLabel.textColor = LabelStyle.textColor
        techStackLabel.textColor = LabelStyle.textColor
        expectationsLabel.textColor = LabelStyle.textColor
    }
    
    private func setupLabels() {
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        experienceTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        techStackTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        expectationsTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        experienceLabel.translatesAutoresizingMaskIntoConstraints = false
        techStackLabel.translatesAutoresizingMaskIntoConstraints = false
        expectationsLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupLayout() {
        view.addSubview(mainTitleLabel)
        view.addSubview(experienceTitleLabel)
        view.addSubview(techStackTitleLabel)
        view.addSubview(expectationsTitleLabel)
        
        view.addSubview(experienceLabel)
        view.addSubview(techStackLabel)
        view.addSubview(expectationsLabel)
        
        NSLayoutConstraint.activate([
            // Constraints for title labels
            mainTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            
            experienceTitleLabel.topAnchor.constraint(equalTo: mainTitleLabel.bottomAnchor, constant: 30),
            experienceTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            techStackTitleLabel.topAnchor.constraint(equalTo: experienceLabel.bottomAnchor, constant: 16),
            techStackTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            expectationsTitleLabel.topAnchor.constraint(equalTo: techStackLabel.bottomAnchor, constant: 16),
            expectationsTitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            // Constraints for content labels
            experienceLabel.topAnchor.constraint(equalTo: experienceTitleLabel.bottomAnchor, constant: 8),
            experienceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            experienceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            techStackLabel.topAnchor.constraint(equalTo: techStackTitleLabel.bottomAnchor, constant: 8),
            techStackLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            techStackLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            expectationsLabel.topAnchor.constraint(equalTo: expectationsTitleLabel.bottomAnchor, constant: 8),
            expectationsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            expectationsLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
}
