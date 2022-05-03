//
//  MyPhotosVC+Delegate.swift
//  UnsplashClient
//
//  Created by Александр on 03.05.2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit

extension MyPhotosViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50.0)
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        performSegue(withIdentifier: "fromFavoriteToInfo", sender: myPhotos[indexPath.item])
    }
}
