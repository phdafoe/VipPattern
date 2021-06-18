//
//  CarrouselPostView.swift
//  VIPPattern
//
//  Created by Andres Felipe Ocampo Eljaiek on 18/6/21.
//

import SwiftUI

struct CarrouselPostView: View {
    
    var title: String
    var model: [ResultViewModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            HStack{
                Text(title).font(.title).fontWeight(.bold).padding(.horizontal)
                Rectangle().fill(Color(UIColor.red).opacity(0.3)).frame(width: 50, height: 5)
            }.padding(.bottom, 10)
            
            ScrollView(.horizontal, showsIndicators: false){
                HStack(alignment: .top, spacing: 15){
                    ForEach(self.model) { item in
                        PosterCardView(model: item).frame(width: 180, height: 270)
                    }
                }
            }
        }
    }
}

//struct CarrouselPostView_Previews: PreviewProvider {
//    static var previews: some View {
//        CarrouselPostView(title: "Movies - show now", model: MoviesServerModel.stubbedMovies)
//    }
//}
