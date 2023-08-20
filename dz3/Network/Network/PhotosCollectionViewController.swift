//
//  PhotosCollectionViewController.swift
//  Network
//
//  Created by Ринат on 09.08.2023.
//

import UIKit

final class PhotosCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    private let myCellIdentifier: String = "MyPhotoCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = Constants.Titles.PhotosTitle

        collectionView.backgroundColor = .systemBackground
        collectionView.register(MyPhotoCell.self, forCellWithReuseIdentifier: myCellIdentifier)

        NetworkService().getPhotos()
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

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        // делаем высоту и ширину одинаковыми чтобы получился квадрат
        let size = UIScreen.main.bounds.width / 2 - 10
        return CGSize(width: size, height: size)
    }
}
