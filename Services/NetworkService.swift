//
//  NetworkService.swift
//  UnsplashClient
//
//  Created by Александр on 02.05.2022.
//  Copyright © 2022 Александр. All rights reserved.
//

import Foundation
import Alamofire


class NetworkService {
    
    private var urlCostruct: URLComponents = {
        
        var constructor = URLComponents()
        constructor.scheme = "https"
        constructor.host = "api.unsplash.com"
        constructor.path = "/search/photos"
        
        
        return constructor
    }()
    
    private func prepareParametres(searchTern: String?) -> [String: String] {
        
        var parametres = [String: String]()
        parametres["page"] = String(1)
        parametres["per_page"] = String(30)
        parametres["query"] = searchTern
        
        return parametres
    }
    
    private func prepareHeader() -> [String: String]? {
        var header = [String: String]()
        
        header["Authorization"] = "Client-ID AlR90nqlHY16ru-vqx65mLW4bh9NI1KILnQluw7_gLQ"
        
        return header
    }
    
    
    
    func fetchPhotos(request: String, compition: @escaping ([Photos]) -> ()) {
        
        guard let url = urlCostruct.url else {return}
        Alamofire.request(url, method: .get, parameters: prepareParametres(searchTern: request),headers: prepareHeader()).responseJSON { (responce) in
            switch (responce.result){
            case .success:
                
                guard let data = responce.data else { return }
                
                do {
                    let object = try JSONDecoder().decode(SearchResultResponce.self, from: data).photos
                    compition(object)
                    
                } catch {
                    print("Erorr to decode JSON", error.localizedDescription)

                }
                
            case .failure:
                print("nononon")
               
            }
        }
    }
    
    func decodeJSON<T: Codable>(type: T.Type, from: Data?) -> T? {
        
        let decoder = JSONDecoder()
        
        guard let data = from else { return nil }
        
        do {
            let object = try decoder.decode(type.self, from: data)
            return object
        } catch {
            print("Erorr to decode JSON", error.localizedDescription)
            return nil
        }
        
    }
    
}
