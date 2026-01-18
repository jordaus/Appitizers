//
//  NetworkManager.swift
//  Appitizers
//
//  Created by Jordan Austin on 1/23/26.
//

import Foundation
import UIKit

//final class creates a singleton NetworkManager to handle network requests throughout the app.
final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    //API Endpoint link
    /*
    static let baseURL = "https://www.jsonkeeper.com/b/"
    static let appetizerEndpoint = baseURL + "LKBTG"
     */
    static let baseURL = "https://696d904ad7bacd2dd713fa80.mockapi.io/"
    static let appetizerEndpoint = baseURL + "Appitizers"
    
    private init() {}
    
    // Function to fetch appetizers from the API
    // The completed closure returns either an array of Appetizer objects or a NetworkError.
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        // Validate the URL
        guard let url = URL(string: NetworkManager.appetizerEndpoint) else {
            completed(.failure(.invalidURL))
            return
        }
        
        // Create a data task to fetch data from the URL
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            // Handle errors from the network request
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            // Validate the HTTP response
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            
            // Validate the received data
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }
            
            // Decode the JSON data into Appetizer objects
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode([Appetizer].self, from: data)
                //completed(.success(decodedResponse.request))
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    func downloadImage(urlString: String, completion: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completion(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            guard let data = data, error == nil, let image = UIImage(data: data) else {
                completion(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completion(image)
        }
        
        task.resume()
        
    }
}
