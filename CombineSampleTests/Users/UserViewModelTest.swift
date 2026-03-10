//
//  UserViewModelTest.swift
//  CombineSampleTests
//
//  Created by Puneet Mahajan on 26/02/26.
//

//import Testing
import XCTest
import Combine
@testable import CombineSample

@MainActor
final class UserViewModelTest: XCTestCase {

    var mockService: MockNetworkService!
    var viewModel: UserListViewModel!
    
    //@Test func testViewModel() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    //}
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        mockService = nil
        viewModel = nil
    }
    
    func test_success_users() {
        
        let users = [
            User(id: 1, name: "Puneet Mahajan", email: "puneet@gmail.com"),
            User(id: 1, name: "Tony Stark", email: "tony@gmail.com")
        ]
        
        let userData = UserList(data: users)
        
        mockService = MockNetworkService(mockResult: userData)
        
        viewModel = UserListViewModel(networkService: mockService)
        viewModel.getUsers()
        
        switch viewModel.state {
        case .Success(let users):
            XCTAssertEqual(users.count, 2)
            
        default: XCTAssert(false)
        }
        
    }
    
    func test_failure_when_data_is_null_users() {
        
        mockService = MockNetworkService(mockResult: nil)
        
        viewModel = UserListViewModel(networkService: mockService)
        viewModel.getUsers()
        
        switch viewModel.state {
        case .Failure(_):
            XCTAssertTrue(true, "Data is null")
            
        default: XCTAssert(false)
        }
    }
    
    func test_failure_when_user_is_null() {
        mockService = MockNetworkService(mockResult: UserList(data: nil))
        
        viewModel = UserListViewModel(networkService: mockService)
        viewModel.getUsers()
        
        switch viewModel.state {
        case .Failure(_):
            XCTAssertTrue(true, "User is null")
            
        default: XCTAssert(false)
        }
    }

}



class MockNetworkService: NetworkServiceProtocol {
    
    private let mockResult: Decodable?
    
    init(mockResult: Decodable?) {
        self.mockResult = mockResult
    }
    
    func fetchApi<T: Decodable>(type: T.Type) -> AnyPublisher<T, Error> {
        
        if mockResult == nil {
            return Fail(error: URLError(.badServerResponse))
                .eraseToAnyPublisher()
        }
        
        if let result = mockResult as? T {
            return Just(result)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
        
        return Fail(error: URLError(.cannotDecodeContentData))
            .eraseToAnyPublisher()
    }
    
}
