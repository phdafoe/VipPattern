//
//  PosterCardPresenter.swift
//  VIPPattern
//
//  Created by Andres Felipe Ocampo Eljaiek on 17/6/21.
//

import Foundation

final class PosterCardGenericPresenter: ObservableObject {
    
    @Published var data = Data()

    func getImageFromURL(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let dataDes = data else { return }
            DispatchQueue.main.async {
                self.data = dataDes
            }
        }
        task.resume()
    }
    
}
