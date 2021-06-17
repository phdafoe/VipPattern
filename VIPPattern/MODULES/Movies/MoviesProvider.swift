//
//  MoviesProvider.swift
//  VIPPattern
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/6/21.
//

import Foundation
import Combine

protocol MoviesProviderProtocol {
    func fetchMovies(completionHadler: @escaping (Result<MoviesServerModel, NetworkingError>) -> ())
}

class MoviesProviderImpl: MoviesProviderProtocol {
    
    let managerReq: RequestManagerProtocol = RequestManager()
    var cancellable: Set<AnyCancellable> = []
    
    internal func fetchMovies(completionHadler: @escaping (Result<MoviesServerModel, NetworkingError>) -> ()){
        
        let request = RequestDTO(params: nil, method: .get, endpoint: "https://rss.itunes.apple.com/api/v1/es/movies/top-movies/all/25/explicit.json")
        
        self.managerReq.requestGeneric(requestDto: request, entityClass: MoviesServerModel.self)
            .sink { [weak self] (completion) in
                guard self != nil else { return }
                switch completion{
                case .finished:
                    break
                case .failure(let error):
                    completionHadler(.failure(error))
                }
            } receiveValue: { [weak self] (resultData) in
                guard self != nil else { return }
                completionHadler(.success(resultData))
            }
            .store(in: &cancellable)

    }
}
