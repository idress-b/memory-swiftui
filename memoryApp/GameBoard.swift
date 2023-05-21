//
//  GameBoard.swift
//  memoryApp
//
//  Created by Idress BENCHELLALI on 15/04/2023.
//

import Foundation

enum Status {
    case loading
    case playing
}



class GameBoard: ObservableObject {
    @Published var cardslevel1: [Card]
    @Published var cards: [Card] = []
    var returnCard: [Card] = []
    @Published var score = 0
    @Published var match: Bool = false
    @Published var levelShow: Bool = false
    @Published var status: Status = .loading
     
    @Published var pairMatched: Int = 0
    var levelWon: Bool = false
    @Published var indexLevel: Int = 0
    var level: Level { return levels[indexLevel]}
   
    init(){
        
        self.cardslevel1 = shuffledEmojis.prefix(12).flatMap{[Card(name: $0), Card(name: $0)]}
        self.initLevel()
    }
    
    func reset(){
        self.status = .loading
        self.score = 0
        self.indexLevel = 0
        self.pairMatched = 0
        self.cards = shuffledEmojis.prefix(level.nbOfPairs).flatMap{[Card(name: $0), Card(name: $0)]}.shuffled()
    }
    
    func initLevel() {
        
        self.cards = shuffledEmojis.prefix(level.nbOfPairs).flatMap{[Card(name: $0), Card(name: $0)]}.shuffled()
    }
    
    func nextLevel(){
        if (self.indexLevel + 1) < levels.count {
            self.indexLevel += 1
        }
        
        self.pairMatched = 0
        self.cards = shuffledEmojis.prefix(level.nbOfPairs).flatMap{[Card(name: $0), Card(name: $0)]}.shuffled()
        self.levelWon = false
        self.levelShow = true
    }
    
    func checkForWin() -> Bool{
      levelWon = level.nbOfPairs == pairMatched
        if levelWon {
            SoundManager.instance.playSound(.win)
        }
        
        return levelWon
        
    }
    
    func flipCard(card: Card){
        print(returnCard.count)
        switch returnCard.count {
        case 0:
            self.flipAppend(card)
        case 1:
            self.flipAppend(card)
            self.compareCards()
            
        default :
            return
        }
        
    }
    
    func flipAppend(_ card: Card){
        card.flip()
        SoundManager.instance.playSound(.flip)
        returnCard.append(card)
    }
    
    func compareCards(){
       
        if returnCard[0].name == returnCard[1].name{
            self.score += 2
            self.pairMatched += 1
            SoundManager.instance.playSound(.match)
            if !self.checkForWin() {
                self.match = true
            }
            
        } else {
    
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                SoundManager.instance.playSound(.mismatch)
            }
            let comparedArray = self.returnCard
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.8) {
               
                comparedArray.forEach{$0.flip()
                }
            }
        }
        
        returnCard.removeAll()
    }
}

