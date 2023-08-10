//
//  ViewController.swift
//  NoStoryboard
//
//  Created by Ринат on 08.08.2023.
//

import UIKit

class ViewController: UIViewController {
    private var labelView_0: UILabel = {
        let label = UILabel()
        label.text = "Нажми на кнопку"
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .systemBackground
        return label
    }()

    private var labelView_1: UILabel = {
        let label = UILabel()
        label.text = "чтобы войти в TabView"
        label.textAlignment = .center
        label.textColor = .black
        label.backgroundColor = .systemBackground
        return label
    }()

    private var buttonView: UIButton = {
        let button = UIButton()
        button.setTitle(" Войти ", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        return button
    }()

    private var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "gb_logo"))
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 2
        imageView.layer.cornerRadius = 15
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground

        setupViews()
        setupConstraints()

        buttonView.addTarget(self, action: #selector(enterTabViewTap), for: .touchUpInside)
    }

    private func setupViews() {
        view.addSubview(labelView_0)
        view.addSubview(labelView_1)
        view.addSubview(buttonView)
        view.addSubview(imageView)
    }

    private func setupConstraints() {
        labelView_0.translatesAutoresizingMaskIntoConstraints = false
        labelView_1.translatesAutoresizingMaskIntoConstraints = false
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            labelView_0.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelView_0.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelView_0.widthAnchor.constraint(equalToConstant: view.frame.size.width / 1.5),

            labelView_1.topAnchor.constraint(equalTo: labelView_0.bottomAnchor),
            labelView_1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelView_1.widthAnchor.constraint(equalTo: labelView_0.widthAnchor),

            buttonView.topAnchor.constraint(equalTo: labelView_1.bottomAnchor, constant: 30),
            buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            imageView.topAnchor.constraint(equalTo: buttonView.bottomAnchor, constant: 30),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

private extension ViewController {
    @objc func enterTabViewTap() {
        let friendsVC = UINavigationController(rootViewController: FriendTableViewController())
        friendsVC.tabBarItem.title = "Друзья"

        let groupsVC = UINavigationController(rootViewController: GroupsTableViewController())
        groupsVC.tabBarItem.title = "Группы"

        let photoVC = UINavigationController(rootViewController:
            PhotosCollectionViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        photoVC.tabBarItem.title = "Фото"

        let tabsControllers = [friendsVC, groupsVC, photoVC]
        let tabBarVC = UITabBarController()
        tabBarVC.viewControllers = tabsControllers

        navigationController?.pushViewController(tabBarVC, animated: true)
    }
}
