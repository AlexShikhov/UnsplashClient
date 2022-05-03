//
//  MyPhotosVC+DataSource.swift
//  UnsplashClient
//
//  Created by Александр on 03.05.2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import UIKit

extension MyPhotosViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myPhotos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "reuseTableView", for: indexPath) as? MyPhotosTableViewCell else { return UITableViewCell() }
        cell.configure(source: myPhotos[indexPath.row])
        
        return cell
    }
    
    
}
