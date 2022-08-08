//
//  TableViewController.swift
//  App-Teste-Intermediario
//
//  Created by Kleiton Mendes on 05/06/22.
//

import Foundation
import UIKit
import CryptoKit
import Alamofire

class TableViewController {
    
//    var charactersArray:[Character] = []
//
//    let ts = String(Date().timeIntervalSince1970)
//    let privateKey = "52a8120753f358d679a81d6a2a7e07aa"
//    let publicKey = "85bec0b844e009a0dda99007cfb76ead5b44f72b"
//    let characterId = ""
    
    var charactersArray: [Character] = []

    let ts = String(Date().timeIntervalSince1970)
    let privateKey = "8bb31074dcefe19047d1690a8aa671dd409cc773"
    let publicKey = "321b54af8f3bf283420e2f77b7116bee"
    let characterId = ""

    func getCount() -> Int {
    return charactersArray.count
    }

    func getCharacter(indexPath: IndexPath) -> Character {
    return self.charactersArray[indexPath.row]
    }

    func MD5(data: String) -> String {
    let hash = Insecure.MD5.hash(data: data.data(using: .utf8) ?? Data())
    return hash.map{ String(format: "%002hx", $0)
    }

    .joined()
    }

    func networkCharacters(name: String?, completion: @escaping (Bool, Error?) -> Void) {
    var url: String = ""
    let hash = self.MD5(data: "\(ts)\(privateKey)\(publicKey)")

    if name != nil {
    let nameCharacter: String = name ?? ""
    print(nameCharacter)
    url = "https://gateway.marvel.com:443/v1/public/characters?nameStartsWith=\(nameCharacter)&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)" } else {
    url = "https://gateway.marvel.com:443/v1/public/characters?limit=100&ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
    }
    print("=======\(url)=======")

    AF.request(url).responseJSON { response in
    if let data = response.data {
    do {
    let result: CharacterAPIResult = try JSONDecoder().decode(CharacterAPIResult.self, from: data)
    self.charactersArray = result.data.results
    completion(true, nil)
    } catch {
    completion(false, error)
    }
    }
    }
    }

    }

// "https://api.themoviedb.org/3/movie/popular?api_key=0f9a3cef12bf5788122f13b1532b9b9e&language=pt-BR")
//let publicKey = "fbd3adec5c17e4fd9ab611820042e6c1"
