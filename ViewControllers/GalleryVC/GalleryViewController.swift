//
//  GalleryViewController.swift
//  UnsplashClient
//
//  Created by Александр on 02.05.2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController {

    //MARK: - IBOUtlet's
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    //MARK: - Properties
    
    
    let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    let network = NetworkService()
    var photoGallery: [Photos] = []
    var timer: Timer?
    
    
    
    //MARK: - Lifecycle
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createCollectionView()
        searchBar.delegate = self
        
        network.fetchRandomPhotos { [weak self] (results) in
            guard let self = self else {return}
            self.photoGallery = results
            self.collectionView.reloadData()
        }
    }
    
    
    
    
    
    //MARK: - Private method
    
    private func createCollectionView() {
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "GalleryViewCell", bundle: nil), forCellWithReuseIdentifier: "reuse")
        collectionView.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionView.contentInsetAdjustmentBehavior = .automatic
    }
    
    
    //MARK: - Prepare for segue

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToInfo" {
            
            let object = sender as? Photos
            guard let viewController = segue.destination as? InformationViewController else {return}
            viewController.sourcePhoto = object
        }
    }
    
}




