//
//  MoviesInteractor.swift
//  VIPPattern
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/6/21.
//

import Foundation

protocol MoviesInteractorProtocol: InteractorPresenterProtocol{
    func fetchDataFromProvider()
}

final class MoviesInteractorImpl: BaseInteractorProtocol {
    
    //DI
    weak var presenter: MoviesPresenterProtocol!
    var provider: MoviesProviderProtocol = MoviesProviderImpl()
}

extension MoviesInteractorImpl: MoviesInteractorProtocol{
    internal func fetchDataFromProvider(){
        self.provider.fetchMovies { [weak self] (result) in
            guard self != nil else { return }
            switch result {
            case .success(let response):
                self?.presenter.getData(data: response.feed?.results ?? [])
            case .failure( let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
}
