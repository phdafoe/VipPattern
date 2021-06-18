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
            Group{
                if !self.presenter.arrayMovies.isEmpty {
                    CarrouselPostView(title: "Movies - show now ", model: self.presenter.arrayMovies)
                }
            }
            Group{
                if !self.presenter.arrayMusic.isEmpty {
                    CarrouselVerticalTwoColumnsView(model: self.presenter.arrayMusic)
                }
            }
            Group{
                if !self.presenter.arrayPodcats.isEmpty {
                    CarrouselPostView(title: "Podcats - show now", model: self.presenter.arrayPodcats)
                }
            }
        }
        .navigationTitle("Movies for iTunes")
        .onAppear(perform: {
            self.presenter.fetchDataFromPresente()
        })
    }
}

struct MoviesView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
