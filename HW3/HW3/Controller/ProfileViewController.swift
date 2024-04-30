//
//  ProfileViewController.swift
//  HW3
//
//  Created by Aliia Satbakova  on 29.04.2024.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var educationLabel: UILabel!
    @IBOutlet weak var cityOfResidenceLabel: UILabel!
    @IBOutlet weak var hometownLabel: UILabel!
    
    private let profileModel = Profile(name: "Алия Сатбакова",
                                       age: "31",
                                       education: "Высшее экономическое",
                                       cityOfResidence: "Новосибирск",
                                       hometown: "Иркутск",
                                       photo: "myAvatar")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupProfileImageData()
        setupProfileTextData()
    }
    
    private func setupProfileImageData() {
        avatarImageView.image = UIImage(named: profileModel.photo)
        avatarImageView.layer.cornerRadius = avatarImageView.frame.height / 2
        avatarImageView.layer.masksToBounds = true
        avatarImageView.layer.borderWidth = 4
        avatarImageView.layer.borderColor = UIColor.black.cgColor
    }
    
    private func setupProfileTextData() {
        nameLabel.text = profileModel.name
        ageLabel.text = profileModel.age
        educationLabel.text = profileModel.education
        cityOfResidenceLabel.text = profileModel.cityOfResidence
        hometownLabel.text = profileModel.hometown
    }
}
