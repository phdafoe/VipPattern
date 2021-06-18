//
//  MoviesProvider.swift
//  VIPPattern
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/6/21.
//

import Foundation
import Combine

protocol MoviesProviderProtocol {
    func fetchMovies(numberMovies: String, completionHadler: @escaping (Result<MoviesServerModel, NetworkingError>) -> ())
    func fetchMusic(numberMusic: String, completionHadler: @escaping (Result<MoviesServerModel, NetworkingError>) -> ())
    func fetchPodcast(numberPodcast: String, completionHadler: @escaping (Result<MoviesServerModel, NetworkingError>) -> ())
}

class MoviesProviderImpl: MoviesProviderProtocol {
    
    let managerReq: RequestManagerProtocol = RequestManager()
    var cancellable: Set<AnyCancellable> = []
    
    internal func fetchMovies(numberMovies: String, completionHadler: @escaping (Result<MoviesServerModel, NetworkingError>) -> ()){
        
        let request = RequestDTO(params: nil, method: .get, endpoint: URLEndpoint.endpointMovies)
        
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
    
    internal func fetchMusic(numberMusic: String, completionHadler: @escaping (Result<MoviesServerModel, NetworkingError>) -> ()){
        
        let request = RequestDTO(params: nil, method: .get, endpoint: URLEndpoint.endpointMusic)
        
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
    
    internal func fetchPodcast(numberPodcast: String, completionHadler: @escaping (Result<MoviesServerModel, NetworkingError>) -> ()){
        
  
        let request = RequestDTO(params: nil, method: .get, endpoint: URLEndpoint.endpointPodcats)
        
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
