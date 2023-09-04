//
//  GroupCell.swift
//  GB_HW_Swift
//
//  Created by Alina on 19.08.2023.
//  Copyright © 2023 Alina. All rights reserved.
//

import UIKit

@available(iOS 13.0, *)
final class GroupCell: UITableViewCell {
    private var groupImageView = UIImageView(image: UIImage(systemName: "person"))
    
    private var title: UILabel = {
        let lable = UILabel()
        lable.text = "Name"
        lable.textColor = .black
        return lable
    }()
    
    private var subtitle: UILabel = {
    let lable = UILabel()
    lable.text = "Description"
    lable.textColor = .black
    return lable
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(groupImageView)
        contentView.addSubview(title)
        contentView.addSubview(subtitle)
        setupConstraints()
    }
    
    
    func updateCell(model:Group){
        title.text = model.name
        subtitle.text = model.description
       
        DispatchQueue.global().async {
            if let url = URL(string: model.photo ?? ""), let data = try?
                Data(contentsOf: url)
            {DispatchQueue.main.async {
                self.groupImageView.image = UIImage(data:data)
                }}
        }
    }
    
    
    private func setupConstraints() {
        groupImageView.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            groupImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            groupImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            groupImageView.heightAnchor.constraint(equalToConstant: 50),
            groupImageView.widthAnchor.constraint(equalTo: groupImageView.heightAnchor),
            
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: groupImageView.trailingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            subtitle.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            subtitle.trailingAnchor.constraint(equalTo: title.trailingAnchor),
            subtitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
            ])
}
}
