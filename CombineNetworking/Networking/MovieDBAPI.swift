//
//  MovieDBAPI.swift
//  CombineNetworking
//
//  Created by Quin’darius Lyles-Woods on 5/11/20.
//  Copyright © 2020 Lavendale. All rights reserved.
//

import Foundation
import Combine

// 1
enum MovieDB {
    static let apiClient = APIClient()
    static let baseUrl = URL(string: "https://api.themoviedb.org/3/")!
}

// 2
enum APIPath: String {
    case trendingMoviesWeekly = "trending/movie/week"
}

extension MovieDB {
    
    static func request(_ path: APIPath) -> AnyPublisher<MovieResponse, Error> {
        // 3
        guard var components = URLComponents(url: baseUrl.appendingPathComponent(path.rawValue), resolvingAgainstBaseURL: true)
            else { fatalError("Couldn't create URLComponents") }
        components.queryItems = [URLQueryItem(name: "api_key", value: "2375c849a03e597be9696ede0f8682d9")] // 4
        
        let request = URLRequest(url: components.url!)
        
        return apiClient.run(request) // 5
            .map(\.value) // 6
            .eraseToAnyPublisher() // 7
    }
}
