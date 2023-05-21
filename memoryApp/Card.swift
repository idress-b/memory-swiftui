//
//  Card.swift
//  memoryApp
//
//  Created by Idress BENCHELLALI on 15/04/2023.
//

import Foundation

class Card: Identifiable, ObservableObject{
    var id = UUID()
    @Published var name: String
    @Published var isFlipped: Bool = false
    
    init(name: String){
        self.name = name
    }
    
    func flip(){
        self.isFlipped.toggle()
        
    }
}
