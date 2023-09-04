//
//  ProfileViewController.swift
//  GB_HW_Swift
//
//  Created by Alina on 23.08.2023.
//  Copyright © 2023 Alina. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    private var networkService = NetworkService()
    private var profileImageView = UIImageView()
    private var model: ProfileModel? = nil
    private var nameLabel: UILabel = {
        var label = UILabel()
        label.textColor = Theme.currentTheme.backgroundColor
        label.textAlignment = .center
        return label
    }()
    
    private var themeView = ThemeView()
    private var isUserProfile: Bool
    
    init(name: String? = nil, photo: UIImage? = nil, isUserProfile: Bool) {
        self.isUserProfile = isUserProfile
        super.init(nibName: nil, bundle: nil)
        self.name.text = name
        profileImageView.image = photo
        themeView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.currentTheme.backgroundColor
        self.title = "Profile"
        setupViews()
        if isUserProfile {
            networkService.getProfile { [weak self] user in
                self?.updateData(model: user)
            }
        } else {
            themeView.isHidden = true
        }
    }
    
    //func updateColor() {
    //    view.backgroundColor = Theme.currentTheme.backgroundColor
    //}
    
    func updateData(model: User?){
        guard let model = model else {return}
        DispatchQueue.global().async {
            if let url = URL(string: model.photo ?? ""), let data = try?
                Data(contentsOf: url)
            {
                DispatchQueue.main.async {
                    self.profileImage.image = UIImage(data: data)
                }
            }
        }
        DispatchQueue.main.async {
            self.nameLable.text = (model.firstName ?? "") + " " + (model.lastName ?? "")
        }
    }
    
    private var avatar: UIImageView = {
        let logo = UIImageView(image: UIImage())
        logo.sizeToFit()
        return logo
    }()
    
    private var name: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.backgroundColor = .systemOrange
        label.text = "Name"
        return label
    }()
    
    
    
    private func setupViews() {
        view.addSubview(profileImageView)
        view.addSubview(nameLabel)
        view.addSubview(themeView)
        setupConstraints()
    }
    
    private func setupConstraints(){
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        themeView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImageView.widthAnchor.constraint(equalToConstant: view.frame.size.width/2),
            profileImageView.heightAnchor.constraint(equalToConstant: view.frame.size.width/2),
            
            nameLabel.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: view.frame.size.width/8),
            
            themeView.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 40),
            themeView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            themeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            themeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
        ])
    }

}

extension ProfileViewController: ThemeViewDelegate{
    func  updateColor() {
        view.backgroundColor = Theme.currentTheme.backgroundColor
        nameLabel.textColor = Theme.currentTheme.textColor
    }
}


