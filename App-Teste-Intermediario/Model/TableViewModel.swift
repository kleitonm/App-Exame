//
//  TableViewModel.swift
//  App-Teste-Intermediario
//
//  Created by Kleiton Mendes on 05/06/22.
//

import Foundation

struct CharacterAPIResult: Codable {
    var status: String
    var data: CharacterAPIData
}

struct CharacterAPIData: Codable {
    var count: Int
    var results: [Character]
}

struct Character: Codable {
    var id: Int
    var name: String
    var description: String
    var thumbnail: [String: String]
}
//
//struct MoviesObject: Decodable {
//    let results : [MovieModel]
//}
//
//struct MovieModel: Decodable {
//    let original_title : String
//    let overview : String
//    let backdrop_path : String
//    let poster_path : String
//    
//    enum CodingKeys: String, CodingKey {
//        case original_title
//        case overview
//        case backdrop_path
//    }
