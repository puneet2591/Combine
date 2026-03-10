//
//  UserViewModel.swift
//  CombineSample
//
//  Created by Puneet Mahajan on 26/02/26.
//

import Combine
import Foundation

@Observable
class UserListViewModel {
    
    private let networkService: NetworkServiceProtocol
    var state: ViewState<[User]> = .Loading
    private var cancellable = Set<AnyCancellable>()
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
    
    func getUsers() {
        self.state = .Loading
        networkService.fetchApi(type: UserList.self)
            .sink { [weak self] completion in
                if case .failure(let error) = completion {
                    debugPrint(error.localizedDescription)
                    self?.state = .Failure(error)
                }
            } receiveValue: { [weak self] users in
                guard let users = users.data else {
                    self?.state = .Failure(URLError(.unknown))
                    return
                }
                self?.state = .Success(users)
            }
            .store(in: &cancellable)
    }
    
}
