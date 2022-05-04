//
//  RandomPhotoResponce.swift
//  UnsplashClient
//
//  Created by Александр on 04.05.2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import Foundation

struct RandomPhotoResponce: Decodable {
    public let photos: [Photos]
}

//extension RandomPhotoResponce: Decodable {
//    enum CodingKeys: String, CodingKey {
//        case photos = "results"
//        
//    }
//}
