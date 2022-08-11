//
//  GalleryVC+DataSource.swift
//  UnsplashClient
//
//  Created by Александр on 03.05.2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit

//MARK: - GalleryViewDataSource

extension GalleryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "reuse", for: indexPath) as? GalleryViewCell else {return UICollectionViewCell()}
        
        let urlImage = photoGallery[indexPath.item].urls.regular
        cell.configure(image: urlImage)
        
        return cell
    }
}
