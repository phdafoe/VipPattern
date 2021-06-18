//
//  PosterCardView.swift
//  VIPPattern
//
//  Created by Andres Felipe Ocampo Eljaiek on 17/6/21.
//

import SwiftUI

struct PosterCardView: View {
    
    var model: ResultViewModel
    @ObservedObject var urlDownloadImage = PosterCardGenericPresenter()
    
    init(model: ResultViewModel) {
        self.model = model
        self.urlDownloadImage.getImageFromURL(imageUrl: model.artworkUrl100 ?? "")
    }
    
    var body: some View {
        VStack(alignment: .leading){
            ZStack(alignment: .bottomLeading){
                Image(uiImage: (self.urlDownloadImage.data.isEmpty ? UIImage(named: "placeholder") : UIImage(data: self.urlDownloadImage.data))!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    //.shadow(radius: 10)
                Rectangle()
                    .fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]), startPoint: .bottom, endPoint: .top))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .overlay(
                        RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 2)
                    )
                Text(model.name ?? "")
                    .padding()
                    .foregroundColor(.white)
            }
        }
        .lineLimit(2)
    }
}

//struct PosterCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        PosterCardView(model: MoviesServerModel.stubeedResultMovie)
//    }
//}
