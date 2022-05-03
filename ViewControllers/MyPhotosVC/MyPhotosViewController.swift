//
//  MyPhotosViewController.swift
//  UnsplashClient
//
//  Created by Александр on 02.05.2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit

class MyPhotosViewController: UIViewController {
    public var myPhotos: [Photos] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        NotificationCenter.default.addObserver(self, selector: #selector(addGroup(notification:)), name: NSNotification.Name(rawValue: "SelectPhoto"), object: nil)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "MyPhotosTableViewCell", bundle: nil), forCellReuseIdentifier: "reuseTableView")
    }
    
    
    //MARK: - Selector
    
    @objc func addGroup(notification: Notification){
        
        guard let photo = notification.object as? Photos else {return}
        
        if myPhotos.contains( where: { soursePhoto in
            soursePhoto.urls.full == photo.urls.full
        }){return} else {
            myPhotos.append(photo)
        }
        
        tableView.reloadData()
    }
    
    @objc func deleteGroup(notification: Notification){
        
        guard let photo = notification.object as? Photos else {return}
        var indexOfSelectPhoto = Int()
        
        for i in 0..<myPhotos.count {
            if myPhotos[i].urls.full == photo.urls.full {
                indexOfSelectPhoto = i
            }
        }
        myPhotos.remove(at: indexOfSelectPhoto)
        tableView.reloadData()
    }

}
