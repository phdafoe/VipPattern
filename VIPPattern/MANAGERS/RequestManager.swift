//
//  RequestManager.swift
//  VIPPattern
//
//  Created by Andres Felipe Ocampo Eljaiek on 15/6/21.
//

import Foundation
import Combine

protocol RequestManagerProtocol: AnyObject {
    func requestGeneric<T: Decodable>(requestDto: RequestDTO, entityClass: T.Type) -> AnyPublisher<T, NetworkingError>
}


class RequestManager: RequestManagerProtocol {
    
    internal func requestGeneric<T: Decodable>(requestDto: RequestDTO, entityClass: T.Type) -> AnyPublisher<T, NetworkingError> {
        let baseurl = URLEndpoint.baseUrl
        let endpoin = "\(baseurl)\(requestDto.endpoint)"
        let urlRequest = URLRequest(url: URL(string: endpoin)!)
        
        return URLSession
            .shared
            .dataTaskPublisher(for: urlRequest)
            .mapError { (error) -> NetworkingError in
                NetworkingError(error: error)
            }
            .flatMap { data, response -> AnyPublisher<T, NetworkingError> in
                guard let httpResponse = response as? HTTPURLResponse else {
                    return Fail(error: NetworkingError(status: .badRequest)).eraseToAnyPublisher()
                }
                if (200...299).contains(httpResponse.statusCode) {
                    return Just(data)
                        .decode(type: T.self, decoder: JSONDecoder())
                        .mapError { (error) in
                            NetworkingError(status: .accepted)
                        }
                        .eraseToAnyPublisher()
                } else {
                    let error = NetworkingError(status: .badServerResponse)
                    return Fail(error: NetworkingError(error: error)).eraseToAnyPublisher()
                }
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
        
    }
}
