//
//  NewsData.swift
//  HackerNews
//
//  Created by Mark Marvin Blanca on 3/11/21.
//

import Foundation

struct NewsData: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    let objectID: String
    let points: Int
    let title: String
    let url: String?
    
    var id: String {
        return objectID
    }
}


