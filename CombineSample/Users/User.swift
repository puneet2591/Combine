//
//  User.swift
//  CombineSample
//
//  Created by Puneet Mahajan on 26/02/26.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name, email: String
}

struct UserList: BaseProtocol, Codable {
    typealias T = [User]?
    var errorMessage: String?
    var data: [User]?
}
