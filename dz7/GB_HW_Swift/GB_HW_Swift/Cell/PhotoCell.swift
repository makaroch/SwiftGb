//
//  PhotoCell.swift
//  GB_HW_Swift
//
//  Created by Alina on 19.08.2023.
//  Copyright © 2023 Alina. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)
final class PhotoCell: UICollectionViewCell {
    
    private let photoView = UIImageView(image: UIImage(systemName:"person"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
}
            
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
    }
            
            private func setupViews() {
                addSubview(photoView)
                setupConstraints()
                
    }
    
    
    func updateCell(model:Photo ){
       
        DispatchQueue.global().async {
            if let url = URL(string: model.sizes.first?.url ?? ""), let data = try?
                Data(contentsOf: url)
            { DispatchQueue.main.async {
                self.photoView.image = UIImage(data:data)
                }}
        }
    }
    
                
    private func setupConstraints() {
        photoView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            photoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            photoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            photoView.topAnchor.constraint(equalTo: topAnchor),
            photoView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])
    }
    
    
    override func prepareForReuse() {
        super .prepareForReuse()
        photoView.image = nil
}
}
