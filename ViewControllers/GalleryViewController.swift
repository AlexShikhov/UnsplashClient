//
//  GalleryViewController.swift
//  UnsplashClient
//
//  Created by Александр on 02.05.2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let itemsPerRow: CGFloat = 2
    private let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    let network = NetworkService()
    var photoGallery: [Photos] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "GalleryViewCell", bundle: nil), forCellWithReuseIdentifier: "reuse")
        collectionView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.contentInsetAdjustmentBehavior = .automatic
        
        }

    }

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
        
        
        network.fetchPhotos(request: searchText) { (results) in
            
            self.photoGallery = results
            self.collectionView.reloadData()
        }
    }
    
}
