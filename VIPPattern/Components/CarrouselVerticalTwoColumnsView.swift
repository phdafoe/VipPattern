//
//  CarrouselVerticalTwoColumnsView.swift
//  VIPPattern
//
//  Created by Andres Felipe Ocampo Eljaiek on 18/6/21.
//

import SwiftUI

struct CarrouselVerticalTwoColumnsView: View {
    var model: [ResultViewModel]
    
    var body: some View {
        LazyVGrid(columns: Array(repeating: GridItem(), count: 2)){
            ForEach(model) { item in
                PosterCardView(model: item)
            }
        }
    }
}

//struct CarrouselVerticalTwoColumnsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CarrouselVerticalTwoColumnsView()
//    }
//}
