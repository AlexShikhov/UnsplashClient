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
    
    let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    let network = NetworkService()
    var photoGallery: [Photos] = []
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        searchBar.delegate = self
        
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




