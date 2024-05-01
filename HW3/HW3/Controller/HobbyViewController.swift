//
//  HobbyViewController.swift
//  HW3
//
//  Created by Aliia Satbakova  on 29.04.2024.
//

import UIKit

class HobbyViewController: UIViewController {
    
    private let mainTitleLabel = UILabel()
    
    private let descriptionLabel = UILabel()
    private let readBooksLabel = UILabel()
    private let runLabel = UILabel()
    private let footballFanLabel = UILabel()
    private let videogamesLabel = UILabel()
    private let takeAPhotoLabel = UILabel()
    
    private let readBooksImageView = UIImageView()
    private let runImageView = UIImageView()
    private let footballFunImageView = UIImageView()
    private let videogamesImageView = UIImageView()
    private let takeAPhotoImageView = UIImageView()
    
    private let hobbyModel = Hobby(description: "В сводобное время:",
                                   readBooks: "Читаю книги 📚",
                                   run: "Бегаю в парке 🏃🏻‍♀️",
                                   footballFan: "Смотрю английский футбол и болею за Chelsea 💙",
                                   videogames: "Играю в Playstation 🎮",
                                   takeAPhoto: "Фотографирую на Fujifilm X100F 📷")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTextData()
        setupHobbyView()
    }
    
    private func setupTextData() {
        mainTitleLabel.text = "Хобби"
        
        descriptionLabel.text = hobbyModel.description
        readBooksLabel.text = hobbyModel.readBooks
        runLabel.text = hobbyModel.run
        footballFanLabel.text = hobbyModel.footballFan
        videogamesLabel.text = hobbyModel.videogames
        takeAPhotoLabel.text = hobbyModel.takeAPhoto
    }

    private func setupHobbyView() {
        setupBackground()
        setupStyleLabels()
        setupLabels()
        setupLayout()
        setupCarousel()
    }
    
    private func setupBackground() {
        view.backgroundColor = LabelStyle.backgroundColorVC
    }
    
    private func setupStyleLabels() {
        mainTitleLabel.font = LabelStyle.mainTitleFont
        descriptionLabel.font = LabelStyle.titleFont
        readBooksLabel.font = LabelStyle.contentFont
        runLabel.font = LabelStyle.contentFont
        footballFanLabel.font = LabelStyle.contentFont
        videogamesLabel.font = LabelStyle.contentFont
        takeAPhotoLabel.font = LabelStyle.contentFont
        
        mainTitleLabel.textAlignment = .center
        descriptionLabel.textAlignment = .natural
        readBooksLabel.textAlignment = .natural
        runLabel.textAlignment = .natural
        footballFanLabel.textAlignment = .natural
        videogamesLabel.textAlignment = .natural
        takeAPhotoLabel.textAlignment = .natural
        
        descriptionLabel.numberOfLines = 0
        readBooksLabel.numberOfLines = 0
        runLabel.numberOfLines = 0
        footballFanLabel.numberOfLines = 0
        videogamesLabel.numberOfLines = 0
        takeAPhotoLabel.numberOfLines = 0
        
        mainTitleLabel.textColor = LabelStyle.textColor
        descriptionLabel.textColor = LabelStyle.textColor
        readBooksLabel.textColor = LabelStyle.textColor
        runLabel.textColor = LabelStyle.textColor
        footballFanLabel.textColor = LabelStyle.textColor
        videogamesLabel.textColor = LabelStyle.textColor
        takeAPhotoLabel.textColor = LabelStyle.textColor
    }
    
    private func setupLabels() {
        mainTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        readBooksLabel.translatesAutoresizingMaskIntoConstraints = false
        runLabel.translatesAutoresizingMaskIntoConstraints = false
        footballFanLabel.translatesAutoresizingMaskIntoConstraints = false
        videogamesLabel.translatesAutoresizingMaskIntoConstraints = false
        takeAPhotoLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupLayout() {
        view.addSubview(mainTitleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(readBooksLabel)
        view.addSubview(runLabel)
        view.addSubview(footballFanLabel)
        view.addSubview(videogamesLabel)
        view.addSubview(takeAPhotoLabel)
        
        NSLayoutConstraint.activate([
            // Constraints for title label
            mainTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            
            // Constraints for content labels
            descriptionLabel.topAnchor.constraint(equalTo: mainTitleLabel.bottomAnchor, constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            readBooksLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 8),
            readBooksLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            readBooksLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            runLabel.topAnchor.constraint(equalTo: readBooksLabel.bottomAnchor, constant: 8),
            runLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            runLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            footballFanLabel.topAnchor.constraint(equalTo: runLabel.bottomAnchor, constant: 8),
            footballFanLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            footballFanLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            videogamesLabel.topAnchor.constraint(equalTo: footballFanLabel.bottomAnchor, constant: 8),
            videogamesLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            videogamesLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            takeAPhotoLabel.topAnchor.constraint(equalTo: videogamesLabel.bottomAnchor, constant: 8),
            takeAPhotoLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            takeAPhotoLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
        ])
    }
    
    private func setupCarousel() {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        // Устанавливаем фиксированную высоту
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(5), height: view.frame.height * 0.3)
        
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: takeAPhotoLabel.bottomAnchor, constant: 25),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // Устанавливаем фиксированную высоту
            scrollView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.3)
        ])
        
        let imageViews = [readBooksImageView, runImageView, footballFunImageView, videogamesImageView, takeAPhotoImageView]
        let images = [UIImage(named: "readBooksImage"), 
                      UIImage(named: "runImage"),
                      UIImage(named: "footballFanImage"),
                      UIImage(named: "videogamesImage"),
                      UIImage(named: "takeAPhotoImage")]
        
        for (index, imageView) in imageViews.enumerated() {
            imageView.translatesAutoresizingMaskIntoConstraints = false
            imageView.image = images[index]
            imageView.contentMode = .scaleAspectFit
            scrollView.addSubview(imageView)
            
            NSLayoutConstraint.activate([
                imageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                imageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor),
                imageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: view.frame.width * CGFloat(index)),
            ])
        }
    } 
}
