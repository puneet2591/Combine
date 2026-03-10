//
//  AnimalTests.swift
//  CombineSampleTests
//
//  Created by Puneet Mahajan on 27/02/26.
//

import XCTest
@testable import CombineSample

@MainActor
final class AnimalTests: XCTestCase {
    
    private var viewModel: AnimalViewModel!
    private var mockService: MockNetworkService!
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
        viewModel = nil
        mockService = nil
    }
    
    func test_success_users() {
        let animals = [
            Animal(name: "Bear", image: nil),
            Animal(name: "Cat", image: nil),
            Animal(name: "Dog", image: nil)
        ]
        
        let animalData = AnimalData(data: animals)
        
        let mockService = MockNetworkService(mockResult: animalData)
        
        viewModel = AnimalViewModel(networkService: mockService)
        viewModel.getAnimals()
        
        switch viewModel.state {
        
        case .Success(let animals):
            
            XCTAssertEqual(animals.count, 3)
            
        default: XCTAssert(false)
        
        }
    }
    
    func test_failure_when_data_is_null_animals() {
        
        let mockService = MockNetworkService(mockResult: nil)
        
        viewModel = AnimalViewModel(networkService: mockService)
        viewModel.getAnimals()
        
        switch viewModel.state {
        
        case .Failure(_):
            
            XCTAssertTrue(true, "Data is null")
            
        default: XCTAssert(false)
        
        }
    }
    
    func test_failure_when_animal_is_null() {
        
        let mockService = MockNetworkService(mockResult: AnimalData(data: nil))
        
        viewModel = AnimalViewModel(networkService: mockService)
        viewModel.getAnimals()
        
        switch viewModel.state {
        
        case .Failure(_):
            
            XCTAssertTrue(true, "Animal is null")
            
        default: XCTAssert(false)
        
        }
    }

}
