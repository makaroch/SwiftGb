//
//  PhotosViewController.swift
//  GB_HW_Swift
//
//  Created by Alina on 19.08.2023.
//  Copyright © 2023 Alina. All rights reserved.
//

import UIKit
@available(iOS 13.0, *)
final class PhotosViewController: UICollectionViewController {
    
    private let networkService = NetworkService()
    private var models: [Photo] = []
    
       override func viewDidLoad(){
        super.viewDidLoad()
        title = "Photo"
        view.backgroundColor = Theme.currentTheme.backgroundColor
        collectionView.backgroundColor = Theme.currentTheme.backgroundColor
        collectionView.register(PhotoCell.self, forCellWithReuseIdentifier: Constants.Identifier.PhotosTitle)
        
        networkService.getPhotos { [weak self] photos in
            self?.models = photos
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    
    override func collectionView(_ _collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
        
}
    
    
    override func collectionView(_ _collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier:
            Constants.Identifier.PhotosTitle, for: indexPath) as? PhotoCell else {
                return UICollectionViewCell()
        }
        
        let model = models[indexPath.row]
        cell.updateCell(model:model)
       return cell
        
        
    }
    
}


@available(iOS 13.0, *)
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width
        let cellSize = width/2-20
        return CGSize(width: cellSize, height: cellSize)
    }
}
