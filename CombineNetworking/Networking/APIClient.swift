//
//  APIClient.swift
//  CombineNetworking
//
//  Created by Quin’darius Lyles-Woods on 5/11/20.
//  Copyright © 2020 Lavendale. All rights reserved.
//

import Foundation
import Combine

struct APIClient {
    struct Response<T> {
        let value: T
        let response: URLResponse
    }
    func run<T: Codable>(_ request: URLRequest) -> AnyPublisher<Response<T>, Error>{
        return URLSession.shared
            .dataTaskPublisher(for: request)
            .tryMap{ result -> Response<T> in
                let value = try JSONDecoder().decode(T.self, from: result.data)
                return Response(value: value, response: result.response)
        }
        .receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
}
