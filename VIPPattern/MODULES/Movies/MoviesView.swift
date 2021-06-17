//
//  MoviesView.swift
//  VIPPattern
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/6/21.
//

import SwiftUI

struct MoviesView: View {
    
    @ObservedObject var presenter = MoviesPresenterImpl()
        
    var body: some View {
        List{
            ForEach(self.presenter.arrayMovies) { item in
                PosterCardView(model: item)
            }
        }
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
