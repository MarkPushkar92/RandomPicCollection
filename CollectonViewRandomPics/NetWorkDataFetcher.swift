//
//  NetWorkDataFetcher.swift
//  CollectonViewRandomPics
//
//  Created by Марк Пушкарь on 18.06.2022.
//

import Foundation

class NetWorkDataFetcher {
    
    var networkService = NetworkingService()
    
    func decodeJSON<T: Decodable>(type: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else {return nil}

        do {
            let objects = try decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print("Failed to decode JSON", jsonError)
            return nil
        }
    }
    
    func fetchImages(completion: @escaping (UnsplashPhoto?) -> ()) {
        networkService.requestRandom { data, error in
            if let error = error {
                print("Error reciever requesting data: \(error.localizedDescription)")
                completion(nil)
            }
            let decode = self.decodeJSON(type: UnsplashPhoto.self, from: data)
            completion(decode)
            print(decode)
        }
    }

}

 
