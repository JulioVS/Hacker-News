//
//  NavigationManager.swift
//  Hacker News
//
//  Created by Julio Errecart on 31/1/26.
//

import Foundation
internal import Combine

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    func fetchData() {
        
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                
                if error == nil {
                    
                    if let safeData = data {
                        
                        let decoder = JSONDecoder()
                        
                        do {
                            
                            let results = try decoder.decode(Results.self, from: safeData)

                            DispatchQueue.main.async {

                                self.posts = results.hits

                            }

                        }
                        catch {

                            print(error)

                        }
                    }
                    
                }
                
            }
            task.resume()
            
        }
        
    }
    
}
