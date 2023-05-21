//
//  ContentView.swift
//  memoryApp
//
//  Created by Idress BENCHELLALI on 15/04/2023.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var gm: GameBoard = GameBoard()
    
    var body: some View {
        
        GeometryReader { geo in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.red, .yellow]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                if gm.status == .loading {
                    GameStart(gm: gm)
                        .frame(width: geo.size.width * 0.5)
                } else {
                    VStack{
                        Image("memory")
                        HStack {
                            Text("Score : \(gm.score)")
                                .font(.largeTitle)
                            Button("start"){
                                gm.reset()
                            }
                        }
                        Spacer()
                        
                        LazyVGrid(
                            columns: Array(repeating: GridItem(.flexible()), count:  gm.level.nbOfColumns), alignment: .trailing,
                            spacing: 20) {
                                ForEach(gm.cards){card in
                                    
                                    HStack {
                                        Spacer()
                                        CardView(card: card)
                                            .frame(height: (geo.size.height / 6))
                                            .onTapGesture {
                                                if !card.isFlipped {
                                                    gm.flipCard(card: card)
                                                }
                                                
                                            }
                                    }
                                }
                            }
                            .padding()
                            .onAppear{
                                
                                gm.levelShow = true
                                
                            }
                      Spacer()
                    }//vstack
                }
                
                if gm.match {
                    Anime(name: "match" )
                        .frame(width: geo.size.width * 0.5)
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                gm.match = false
                            }
                        }
                }//if
                if gm.levelShow {
                    Anime(name: gm.level.name )
                        .frame(width: geo.size.width * 0.5)
                        .onAppear{
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                gm.levelShow = false
                            }
                        }
                }//if
                
                if gm.levelWon {
                    
                    ZStack {
                        Color.black.opacity(0.8)
                            .ignoresSafeArea()
                        VStack {
                            Spacer()
                            Anime(name: "win")
                                .frame(width: geo.size.width * 0.5)
                                .onAppear{
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                        print("ok")
                                    }
                                }
                            Spacer()
                                .frame(height: 40)
                            AnimatedButton(text: "NEXT LEVEL >"){
                                gm.nextLevel()
                            }
                            Spacer()
                        }

                        
                    }
                }
            }//zstack
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
