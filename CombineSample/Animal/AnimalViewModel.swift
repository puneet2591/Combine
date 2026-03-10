//
//  AnimalViewModel.swift
//  CombineSample
//
//  Created by Puneet Mahajan on 18/02/26.
//

import Foundation
import Combine

@Observable
class AnimalViewModel {
    
    private let networkService: NetworkServiceProtocol
    private var cancellable = Set<AnyCancellable>()
    var state: ViewState<[Animal]> = .Idle
        
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getAnimals() {
        self.state = .Loading
        networkService.fetchApi(type: AnimalData.self)
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    debugPrint(error.localizedDescription)
                    self?.state = .Failure(error)
                }
            } receiveValue: { [weak self] animals in
                guard let animals = animals.data else {
                    self?.state = .Failure(URLError(.unknown))
                    return
                }
                self?.state = .Success(animals)
            }
            .store(in: &cancellable)
    }
}
