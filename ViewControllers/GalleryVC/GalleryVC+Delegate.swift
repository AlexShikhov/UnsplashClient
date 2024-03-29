//
//  GalleryVC+Delegate.swift
//  UnsplashClient
//
//  Created by Александр on 03.05.2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit


//MARK: - GalleryViewDelegate




extension GalleryViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToInfo", sender: photoGallery[indexPath.item])
    }
}




//MARK: - CollectionViewDelegateFlowLayout




extension GalleryViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let photo = photoGallery[indexPath.item]
        
        let width = view.frame.width - 40
        let heigth = CGFloat(photo.width / photo.height) * width
        return CGSize(width: width, height: heigth)

    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        return sectionInsets
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {

        return sectionInsets.left
    }

}



//MARK: - SearchBarDelegate



extension GalleryViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (_) in
            self.network.fetchPhotos(request: searchText) { [weak self] (results) in
                guard let self = self else {return}
                self.photoGallery = results
                self.collectionView.reloadData()
            }
        }
    }
}
