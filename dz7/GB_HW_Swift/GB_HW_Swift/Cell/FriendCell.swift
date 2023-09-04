//
//  FriendCell.swift
//  GB_HW_Swift
//
//  Created by Alina on 19.08.2023.
//  Copyright © 2023 Alina. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
final class FriendCell: UITableViewCell {
    private var friendImageView = UIImageView(image: UIImage(systemName: "person"))
    
    var tap: ((String?, UIImage?) -> Void)?
    
    private var textL: UILabel = {
            let label = UILabel()
            label.text = "Name"
            label.textColor = .black
            return label
        }()
    
    private var onlineCircle: UIView = {
        let online = UIView()
        online.backgroundColor = .gray
        online.layer.cornerRadius = 8
        return online
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(cellClick))
        addGestureRecognizer(recognizer)
        setupView()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        friendImageView.image = nil
        textL.text = nil
        onlineCircle.backgroundColor = .gray
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(friendImageView)
        contentView.addSubview(textL)
        friendImageView.addSubview(onlineCircle)
        setupConstraints()
    }
    

    
    func updateCell(model: Friend) {
        textL.text = (model.firstName ?? "") + " " + (model.lastName ?? "")
        if let online = model.online {
            let isOnline = online == 1
            if isOnline {
                onlineCircle.backgroundColor = .green
            } else {
                onlineCircle.backgroundColor = .red
            }
        }
        DispatchQueue.global().async {
            if let url = URL(string: model.photo ?? ""), let data = try? Data(contentsOf: url) {
                DispatchQueue.main.async {
                    self.friendImageView.image = UIImage(data: data)
                }
            }
        }
    }
    
    private func setupConstraints() {
        friendImageView.translatesAutoresizingMaskIntoConstraints = false
        textL.translatesAutoresizingMaskIntoConstraints = false
        onlineCircle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            friendImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            friendImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            friendImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            friendImageView.widthAnchor.constraint(equalTo: friendImageView.heightAnchor),
            friendImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            onlineCircle.widthAnchor.constraint(equalToConstant: 20),
            onlineCircle.heightAnchor.constraint(equalTo: onlineCircle.widthAnchor),
            onlineCircle.bottomAnchor.constraint(equalTo: friendImageView.bottomAnchor),
            onlineCircle.trailingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 10),
            
            textL.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            textL.leadingAnchor.constraint(equalTo: friendImageView.trailingAnchor, constant: 10),
            textL.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10)
            ])
    }
    
    @objc private func cellClick(){
        tap?(textL.text, friendImageView.image)
    }
}
