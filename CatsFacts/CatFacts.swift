//
//  CatFacts.swift
//  CatsFacts
//
//  Created by Marius on 2023-11-13.
//

import Foundation

class CatsFacts: Decodable {
    var data: Cat
}

struct Cat: Decodable {
        let fact: String
        let length: Int
}
