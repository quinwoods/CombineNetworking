//
//  Movie.swift
//  CombineNetworking
//
//  Created by Quin’darius Lyles-Woods on 5/11/20.
//  Copyright © 2020 Lavendale. All rights reserved.
//

import Foundation

struct Movie: Codable, Identifiable{
    var id = UUID()
    let movieId: Int
    let originalTitle: String
    let title: String
    
   enum CodingKeys: String, CodingKey {
           case movieId = "id"
           case originalTitle = "original_title"
           case title
       }
}
