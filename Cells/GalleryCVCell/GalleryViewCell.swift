//
//  GalleryViewCell.swift
//  UnsplashClient
//
//  Created by Александр on 02.05.2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit
import SDWebImage

class GalleryViewCell: UICollectionViewCell {

    @IBOutlet weak var imageView: UIImageView!
    
    override func prepareForReuse() {
            super.prepareForReuse()
            
            imageView.image = nil
        }
        
        override func awakeFromNib() {
            super.awakeFromNib()


        }
        
        func configure(image: String){
            
            let imageURL = URL(string: image)
            imageView.sd_setImage(with: imageURL, completed: nil)
        }

    }
