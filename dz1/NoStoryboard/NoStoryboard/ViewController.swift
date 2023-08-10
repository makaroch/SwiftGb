//
//  ViewController.swift
//  NoStoryboard
//
//  Created by Ринат on 06.08.2023.
//

import UIKit

class ViewController: UIViewController {
    private var imageView: UIImageView = {
        guard let image = UIImage(named: "gb_logo") else {
            // если не нашло почему-то мою картинку то пусть грузит системную,
            // системная точно всегда должна быть на месте
            return UIImageView(image: UIImage(systemName: "person"))
        }
        return UIImageView(image: image)
    }()

    private var labelView: UILabel = {
        let label = UILabel()
        label.text = "Авторизация (без Storyboard)"
        label.textAlignment = .center
        return label
    }()

    private var textFldLoginView: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Логин"
        return textField
    }()

    private var textFldPasswordView: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Пароль"
        return textField
    }()

    private var buttonView: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        view.addSubview(imageView)
        view.addSubview(labelView)
        view.addSubview(textFldLoginView)
        view.addSubview(textFldPasswordView)
        view.addSubview(buttonView)
    }

    private func setupConstraints() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        labelView.translatesAutoresizingMaskIntoConstraints = false
        textFldLoginView.translatesAutoresizingMaskIntoConstraints = false
        textFldPasswordView.translatesAutoresizingMaskIntoConstraints = false
        buttonView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            labelView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            labelView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelView.widthAnchor.constraint(equalToConstant: view.frame.size.width / 1.5),
            labelView.heightAnchor.constraint(equalToConstant: view.frame.size.width / 4),

            textFldLoginView.topAnchor.constraint(equalTo: labelView.bottomAnchor, constant: 20),
            textFldLoginView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFldLoginView.widthAnchor.constraint(equalToConstant: view.frame.size.width / 5),

            textFldPasswordView.topAnchor.constraint(equalTo: textFldLoginView.bottomAnchor, constant: 20),
            textFldPasswordView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textFldPasswordView.widthAnchor.constraint(equalToConstant: view.frame.size.width / 5),

            buttonView.topAnchor.constraint(equalTo: textFldPasswordView.topAnchor, constant: 30),
            buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
        ])
    }
}
