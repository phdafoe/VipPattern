//
//  ResultViewModel.swift
//  VIPPattern
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/6/21.
//

import Foundation

// MARK: - Result
struct ResultViewModel: Identifiable {
    
    let artistName: String?
    let id: String?
    let releaseDate: String?
    let name: String?
    let copyright: String?
    let artworkUrl100: String?
    
    init(businessModel: ResultModel){
        artistName = businessModel.artistName
        id = businessModel.id
        releaseDate = businessModel.releaseDate
        name = businessModel.name
        copyright = businessModel.copyright
        artworkUrl100 = businessModel.artworkUrl100
    }

}
