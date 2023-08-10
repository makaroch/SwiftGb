//
//  MyPhotoCell.swift
//  TabsAndTables
//
//  Created by Ринат on 08.08.2023.
//

import UIKit

class MyPhotoCell: UICollectionViewCell {
    private var imageView = UIImageView(image: UIImage(systemName: "person"))

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)

        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
