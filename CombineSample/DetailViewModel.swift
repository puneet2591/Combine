//
//  DetailViewModel.swift
//  CombineSample
//
//  Created by Puneet Mahajan on 19/02/26.
//


import Combine
import SwiftUI

@Observable
class DetailViewModel {
    
    private let networkService: NetworkServiceProtocol
    private var cancellable = Set<AnyCancellable>()
    var state: ViewState<[Animal]> = .Idle
    
    init(networkService: NetworkServiceProtocol = NetworkService(url: "https://api-dev-scus-demo.azurewebsites.net/api/Animal/GetAnimals")) {
        self.networkService = networkService
    }
    
    func getAnimals() {
        
        networkService.fetchApi(type: AnimalData.self)
            .sink { completion in
                if case .failure(let error) = completion {
                    self.state = .Failure(error)
                }
            } receiveValue: { animals in
                guard let animals = animals.data else {
                    self.state = .Failure(URLError(.unknown))
                    return
                }
                self.state = .Success(animals)
            }
            .store(in: &cancellable)
    }
    
}
