//
//  PostData.swift
//  Hacker News
//
//  Created by Julio Errecart on 31/1/26.
//

import Foundation

struct Results: Decodable {
    
    // From JSON returned by https://hn.algolia.com/api/v1/search?tags=front_page
    // Property names need to *exactly* match Key names in the JSON in order to propoerly decode
    
    let hits: [Post]
    
}

struct Post: Decodable, Identifiable {

    // Computed (derived) propert
    // Needs to be called "id" in order to conform to the 'Identifiable' protocol
    
    var id: String {
        return objectID
    }

    // From JSON returned by https://hn.algolia.com/api/v1/search?tags=front_page
    // Property names need to *exactly* match Key names in the JSON in order to propoerly decode
    
    let objectID: String
    let points: Int
    let title: String
    let url: String?
    
}
