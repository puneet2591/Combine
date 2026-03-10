//
//  NetworkService.swift
//  CombineSample
//
//  Created by Puneet Mahajan on 18/02/26.
//

import Combine
import Foundation

protocol NetworkServiceProtocol {
    
    func fetchApi<T: Decodable>(type: T.Type) -> AnyPublisher<T, Error>
}

struct NetworkService: NetworkServiceProtocol {
    
    var url: String
    
    init(url: String) {
        self.url = url
    }
    
    //let urlString = "https://api-dev-scus-demo.azurewebsites.net/api/Animal/GetAnimals"
    
    func fetchApi<T: Decodable>(type: T.Type) -> AnyPublisher<T, Error> {
        return URLSession.shared
            .dataTaskPublisher(for: URL(string: url)!)
            .map(\.data)
            .decode(type: type, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .retry(2)
            .eraseToAnyPublisher()
    }
    
}
