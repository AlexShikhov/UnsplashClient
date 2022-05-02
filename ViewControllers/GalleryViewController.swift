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
    
    let network = NetworkService()
    var photoGallery: [Photos] = []
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            

            searchBar.delegate = self
            
            collectionView.dataSource = self
            collectionView.register(UINib(nibName: "GalleryViewCell", bundle: nil), forCellWithReuseIdentifier: "reuse")
            
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

    extension GalleryViewController: UISearchBarDelegate {
        
        func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
            
    //        guard let request = searcBar.text else { return }
    //
    //        network.fetchPhotos(request: request) { (results) in
    //
    //            self.photoGallery = results
    //            self.collectionView.reloadData()
    //        }
        }
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {

            
                    network.fetchPhotos(request: searchText) { (results) in
            
                        self.photoGallery = results
                        self.collectionView.reloadData()
                    }
        }
    }
