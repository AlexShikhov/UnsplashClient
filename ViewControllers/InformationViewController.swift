//
//  InformationViewController.swift
//  UnsplashClient
//
//  Created by Александр on 02.05.2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit
import SDWebImage

class InformationViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var createLabel: UILabel!
    @IBOutlet weak var locatonLabel: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    var sourcePhoto: Photos?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let sourcePhoto = sourcePhoto as? Photos else {
            return
        }
        nameLabel.text = sourcePhoto.user.name 
        createLabel.text = sourcePhoto.create ?? "no info"
        locatonLabel.text = sourcePhoto.user.location ?? "no info"
        
        imageView.sd_setImage(with: URL(string: sourcePhoto.urls.regular), completed: nil)
        deleteButton.layer.cornerRadius = 10
        addButton.layer.cornerRadius = 10
        
    }
    
//MARK: - Alert
    
    func showAlert(header: String, message: String) {
        let alertController = UIAlertController(title: header, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Delete", style: .destructive) { (action) in
            NotificationCenter.default.post(name: NSNotification.Name("DeletePhoto"), object: self.sourcePhoto)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alertController.addAction(action)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    
    
    
    
//MARK: - Action
    @IBAction func deleteButtonPress(_ sender: Any) {
        guard let sourcePhoto = sourcePhoto as? Photos else {
            return
        }
        showAlert(header: "Attention!", message: "Do you really want to delete this photo from favorite?")
        
        
    }
    
    @IBAction func addButtonPress(_ sender: Any) {
        guard let sourcePhoto = sourcePhoto as? Photos else {
            return
        }
        NotificationCenter.default.post(name: NSNotification.Name("SelectPhoto"), object: sourcePhoto)
        
    }
    

}
