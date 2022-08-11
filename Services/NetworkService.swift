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
    
    //MARK: - URL Construct
    
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
        parametres["per_page"] = String(50)
        parametres["query"] = searchTern
        
        return parametres
    }
    
  
    
    private func prepareHeader() -> [String: String]? {
        var header = [String: String]()
        
        header["Authorization"] = "Client-ID AlR90nqlHY16ru-vqx65mLW4bh9NI1KILnQluw7_gLQ"
        
        return header
    }
    
    
    //MARK: - Servis for photoSearch
    
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
    
    
    
    //MARK: - Service for random photo
    
    private var randomUrlCostruct: URLComponents = {
        
        var constructor = URLComponents()
        
        constructor.scheme = "https"
        constructor.host = "api.unsplash.com"
        constructor.path = "/photos/random"
        
        
        return constructor
    }()
    
    private func prepareParametresForRandom() -> [String: String] {
          
          var parametres = [String: String]()
          parametres["count"] = "20"
          
          return parametres
      }
    
    func fetchRandomPhotos(compition: @escaping ([Photos]) -> ()) {
        
        guard let url = randomUrlCostruct.url else {return}
        Alamofire.request(url, method: .get, parameters: prepareParametresForRandom(), headers: prepareHeader()).responseJSON { (responce) in
            switch (responce.result){
            case .success:
                
                guard let data = responce.data else { return }
                print(data)
                
                do {
                    let object = try JSONDecoder().decode([Photos].self, from: data)
                    
                    compition(object)
                } catch {
                    print("Erorr to decode JSON", error.localizedDescription)
                }
                
            case .failure:
                print("Failure responce")
            }
        }
    }
}
