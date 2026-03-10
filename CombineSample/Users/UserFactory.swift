//
//  UserFactory.swift
//  CombineSample
//
//  Created by Puneet Mahajan on 26/02/26.
//

import Foundation

struct UserFactory {
    
    static func createUserFactory() -> NetworkServiceProtocol {
        
        return NetworkService(url: "http://localhost:3000/users")
    }
}
