//
//  SearchResultResponce.swift
//  UnsplashClient
//
//  Created by Александр on 02.05.2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import Foundation


struct SearchResultResponce{
    public let photos: [Photos]
}

extension SearchResultResponce: Decodable {
    enum CodingKeys: String, CodingKey {
        case photos = "results"
    }
}
