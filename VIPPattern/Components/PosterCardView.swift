//
//  PosterCardView.swift
//  VIPPattern
//
//  Created by Andres Felipe Ocampo Eljaiek on 17/6/21.
//

import SwiftUI

struct PosterCardView: View {
    
    var model: ResultViewModel
    @ObservedObject var urlDownloadImage = PosterCardPresenter()
    
    init(model: ResultViewModel) {
        self.model = model
        self.urlDownloadImage.getImageFromURL(imageUrl: model.artworkUrl100 ?? "")
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(uiImage: (self.urlDownloadImage.data.isEmpty ? UIImage(named: "placeholder") : UIImage(data: self.urlDownloadImage.data))!)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 180, height: 270)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(radius: 10)
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]), startPoint: .bottom, endPoint: .top))
                .frame(width: 180, height: 270)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .overlay(
                    RoundedRectangle(cornerRadius: 20).stroke(Color.white, lineWidth: 4)
                )
            Text(model.name ?? "")
                .padding()
                .font(.callout)
                .foregroundColor(.white)
        }
    }
}

//struct PosterCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        PosterCardView(model: MoviesServerModel.stubeedResultMovie)
//    }
//}
