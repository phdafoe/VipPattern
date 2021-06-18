//
//  MoviesInteractor.swift
//  VIPPattern
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/6/21.
//

import Foundation

protocol MoviesInteractorProtocol: InteractorPresenterProtocol{
    func fetchDataMoviesFromProvider()
    func fetchDataMusicFromProvider()
    func fetchDataPodcatsFromProvider()
}

final class MoviesInteractorImpl: BaseInteractorProtocol {
    
    //DI
    weak var presenter: MoviesPresenterProtocol!
    var provider: MoviesProviderProtocol = MoviesProviderImpl()
}

extension MoviesInteractorImpl: MoviesInteractorProtocol{
    internal func fetchDataMoviesFromProvider(){
        self.provider.fetchMovies(numberMovies: "\(25)") { [weak self] (result) in
            guard self != nil else { return }
            switch result {
            case .success(let response):
                self?.presenter.getDataMovies(data: response.feed?.results ?? [])
            case .failure( let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    internal func fetchDataMusicFromProvider(){
        self.provider.fetchMusic(numberMusic: "\(10)") { [weak self] (result) in
            guard self != nil else { return }
            switch result {
            case .success(let response):
                self?.presenter.getDataMusic(data: response.feed?.results ?? [])
            case .failure( let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    internal func fetchDataPodcatsFromProvider(){
        self.provider.fetchPodcast(numberPodcast: "\(25)") { [weak self] (result) in
            guard self != nil else { return }
            switch result {
            case .success(let response):
                self?.presenter.getDataPodcats(data: response.feed?.results ?? [])
            case .failure( let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
