//
//  PhotosCollectionViewController.swift
//  TabsAndTables
//
//  Created by Ринат on 08.08.2023.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    private let myCellIdentifier: String = "MyPhotoCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Фото"
        collectionView.backgroundColor = .systemBackground
        collectionView.register(MyPhotoCell.self, forCellWithReuseIdentifier: myCellIdentifier)
    }

    override func numberOfSections(in _: UICollectionView) -> Int {
        1
    }

    override func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        6
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: myCellIdentifier, for: indexPath)
        return cell
    }
}
