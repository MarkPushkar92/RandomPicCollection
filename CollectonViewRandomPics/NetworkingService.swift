//
//  File.swift
//  CollectonViewRandomPics
//
//  Created by Марк Пушкарь on 18.06.2022.
//

import Foundation

class NetworkingService {
    
        private func prepareHeader() -> [String: String] {
            var headers = [String: String]()
            headers["Authorization"] = "Client-ID _9OHfp6PFBFAc6oBAuxJmga4HPL8ynYT53ytx4CoZM8"
            return headers
        }
        
        private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
            return URLSession.shared.dataTask(with: request) { data, response, error in
                DispatchQueue.main.async {
                    completion(data, error)
                }
            }
        }
    //MARK: - Random Photo Logic
            
        func requestRandom(completion: @escaping (Data?, Error?) -> Void) {
            let url = self.randomUrl()
            var request = URLRequest(url: url)
            request.allHTTPHeaderFields = prepareHeader()
            request.httpMethod = "get"
            let task = createDataTask(from: request, completion: completion)
            task.resume()
        }
            
        private func randomUrl() -> URL {
            var components = URLComponents()
            components.scheme = "https"
            components.host = "api.unsplash.com"
            components.path = "/photos/random"
            return components.url!
        }
            
}


