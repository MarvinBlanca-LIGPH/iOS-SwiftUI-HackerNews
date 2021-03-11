//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Mark Marvin Blanca on 3/11/21.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        if let urlString = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: urlString) { (data, response, error) in
                if error == nil {
                    
                    if let safeData = data {
                        if let newsData = self.decodeData(data: safeData) {
                            DispatchQueue.main.async {
                                self.posts = newsData.hits
                            }
                        }
                    }
                }
            }
            
            task.resume()
        }
    }
    
    func decodeData(data: Data) -> NewsData? {
        do {
            let decoder = try JSONDecoder().decode(NewsData.self, from: data)
            return decoder
        } catch {
            print(error)
            return nil
        }
    }
}
