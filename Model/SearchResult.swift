//
//  SearchResult.swift
//  UnsplashClient
//
//  Created by Александр on 02.05.2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import Foundation

//struct SearchResult {
//    var total: String
//    var results: [Photos]
//}
//
//extension SearchResult: Codable{
//    enum CodingKeys: String, CodingKey {
//        case total = "total"
//        case results = "results"
//    }
//}

struct Photos {
    var urls: URLKing
    var width: Int
    var height: Int
}

extension Photos: Codable {
    enum CodingCase: String, CodingKey {
        case urls = "urls"
        case width = "width"
        case height = "height"
    }
}

struct URLKing {
    let raw: String
    let full: String
    let regular: String
    let small: String
    let thumb: String
}

extension URLKing: Codable {
    enum CodingCase: String, CodingKey {
        case raw = "raw"
        case full = "full"
        case regular = "regular"
        case small = "small"
        case thumb = "thumb"
    }
}

struct PhotosSize {
    var heigth: Int
    var weigth: Int
}

extension PhotosSize: Codable {
    enum CodingCase: String, CodingKey {
        case heigth = "heigth"
        case weigth = "weigth"
    }
}

