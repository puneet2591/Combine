//
//  AnimalModel.swift
//  CombineSample
//
//  Created by Puneet Mahajan on 18/02/26.
//

import Foundation


struct Animal: Decodable, Identifiable {
    var id: String
    var name: String
    var image: String?
    
    init(name: String, image: String?) {
        self.id = UUID().uuidString
        self.name = name
        self.image = image
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = UUID().uuidString
        self.name = try values.decode(String.self, forKey: .name)
        self.image = try? values.decodeIfPresent(String.self, forKey: .image)
    }
    
    enum CodingKeys: String, CodingKey {
        case name, image
    }
}

enum ViewState<T: Decodable> {
    
    case Idle
    case Loading
    case Success(T)
    case Failure(Error)
}

protocol BaseProtocol {
    associatedtype T
    var errorMessage: String? { get set }
    var data: T { get set }
}

struct AnimalData: Decodable, BaseProtocol {
    
    typealias T = [Animal]?
    var errorMessage: String?
    var data: [Animal]?
    
    init(data: [Animal]?) {
        errorMessage = "Could not connect to server"
        self.data = data
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.errorMessage = try values.decodeIfPresent(String.self, forKey: .errorMessage) ?? ""
        self.data = try values.decode([Animal].self, forKey: .data)
    }
    
    enum CodingKeys: String, CodingKey {
        case data, errorMessage
    }
}
