//
//  MoviesView.swift
//  CombineNetworking
//
//  Created by Quin’darius Lyles-Woods on 5/11/20.
//  Copyright © 2020 Lavendale. All rights reserved.
//

import SwiftUI

struct MoviesView: View {
// will allow us to know if any changes happen withing the view model
    @ObservedObject var viewModel = MovieViewModel()
    
    var body: some View {
        //this list works with combine for real time updates to the list
        List(viewModel.movies){ movie in
            HStack{
                VStack(alignment: .leading){
                    Text(movie.title).font(.headline)
                    Text(movie.originalTitle).font(.subheadline)
                }
            }
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
