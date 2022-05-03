//
//  MyPhotosTableViewCell.swift
//  UnsplashClient
//
//  Created by Александр on 02.05.2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit
import SDWebImage

class MyPhotosTableViewCell: UITableViewCell {

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        photoImage.image = nil
        infoLabel.text = nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    //MARK: - Config func
    
    func configure(source photo: Photos) {
        photoImage.sd_setImage(with: URL(string: photo.urls.regular), completed: nil)
        infoLabel.text = String(photo.user.name)
    }
}
