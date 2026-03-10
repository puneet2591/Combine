//
//  AnimalFactory.swift
//  CombineSample
//
//  Created by Puneet Mahajan on 27/02/26.
//

import Foundation

struct AnimalFactory {
    
    static func createAnimalFactory() -> NetworkServiceProtocol {
        
        return NetworkService(url: "https://api-dev-scus-demo.azurewebsites.net/api/Animal/GetAnimals")
    }
} 
