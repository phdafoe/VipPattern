//
//  MoviesPresenter.swift
//  VIPPattern
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/6/21.
//

import Foundation

protocol MoviesPresenterProtocol: PresenterInteractorProtocol {
    func getData(data: [ResultModel])
}


final class MoviesPresenterImpl: BasePresenteProtocol, ObservableObject {
    
    //DI
    var interactor: MoviesInteractorProtocol!
    @Published var arrayMovies: [ResultViewModel] = []
    
    func fetchDataFromPresente(){
        self.interactor.fetchDataFromProvider()
    }
  
    
}

extension MoviesPresenterImpl: MoviesPresenterProtocol{
    func getData(data: [ResultModel]) {
        self.arrayMovies.removeAll()
        self.arrayMovies = data.map { ResultViewModel(businessModel: $0) }
    }
}
