//
//  Model.swift
//  memoryApp
//
//  Created by Idress BENCHELLALI on 16/04/2023.
//

import Foundation

struct Level{
    var name: String
    var nbOfColumns: Int
    var nbOfPairs: Int
    var rowSize: Int
}

let levels: [Level] = [
    Level(name: "level1", nbOfColumns: 4, nbOfPairs: 4, rowSize: 5),
    Level(name: "level2", nbOfColumns: 4, nbOfPairs: 6, rowSize: 5),
    Level(name: "level3", nbOfColumns: 4, nbOfPairs: 8, rowSize: 6),
    Level(name: "level4", nbOfColumns: 5, nbOfPairs: 10, rowSize: 6),
    Level(name: "level5", nbOfColumns: 6, nbOfPairs: 12,rowSize: 6),
    
]

