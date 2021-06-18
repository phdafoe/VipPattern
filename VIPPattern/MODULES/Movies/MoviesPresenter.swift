//
//  MoviesPresenter.swift
//  VIPPattern
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/6/21.
//

import Foundation

protocol MoviesPresenterProtocol: PresenterInteractorProtocol {
    func getDataMovies(data: [ResultModel])
    func getDataMusic(data: [ResultModel])
    func getDataPodcats(data: [ResultModel])
}


final class MoviesPresenterImpl: BasePresenteProtocol, ObservableObject {
    
    //DI
    var interactor: MoviesInteractorProtocol!
    @Published var arrayMovies: [ResultViewModel] = []
    @Published var arrayMusic: [ResultViewModel] = []
    @Published var arrayPodcats: [ResultViewModel] = []
    
    
    func fetchDataFromPresente(){
        self.interactor.fetchDataMoviesFromProvider()
        self.interactor.fetchDataMusicFromProvider()
        self.interactor.fetchDataPodcatsFromProvider()
    }
  
    
}

extension MoviesPresenterImpl: MoviesPresenterProtocol{
    func getDataMovies(data: [ResultModel]) {
        self.arrayMovies.removeAll()
        self.arrayMovies = data.map { ResultViewModel(businessModel: $0) }
    }
    func getDataMusic(data: [ResultModel]) {
        self.arrayMusic.removeAll()
        self.arrayMusic = data.map { ResultViewModel(businessModel: $0) }
    }
    func getDataPodcats(data: [ResultModel]) {
        self.arrayPodcats.removeAll()
        self.arrayPodcats = data.map { ResultViewModel(businessModel: $0) }
    }
}
