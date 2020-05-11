//
//  MovieViewModel.swift
//  CombineNetworking
//
//  Created by Quin’darius Lyles-Woods on 5/11/20.
//  Copyright © 2020 Lavendale. All rights reserved.
//

import Foundation
import Combine

class MovieViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    var callcellationToken: AnyCancellable?
    
    init() {
        getMovies()
    }
}

extension MovieViewModel{
    func getMovies(){
        callcellationToken = MovieDB.request(.trendingMoviesWeekly)
            .mapError({(error) -> Error in
                print(error)
                return error
            })
            .sink(receiveCompletion: { _ in},
                  receiveValue: {
                    self.movies = $0.movies
            })
    }
}
