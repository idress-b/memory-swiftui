//
//  GameStart.swift
//  memoryApp
//
//  Created by Idress BENCHELLALI on 16/04/2023.
//

import SwiftUI

struct GameStart: View {
    @ObservedObject var gm: GameBoard 
    var body: some View {
        VStack{
            Spacer()
            Anime(name: "memory")
            Spacer()
            Button {
                gm.status = .playing
            } label: {
                Text("Start".uppercased())
                    .font(.system(size: 50))
                    .bold()
                    .foregroundColor(.white)
                                   .padding()
                                   .frame(minWidth: 0, maxWidth: .infinity)
                                   .background(.orange)
                                   .cornerRadius(20)
                                   .padding(.horizontal)
            }

            Spacer()
        }
    }
}

struct GameStart_Previews: PreviewProvider {
    static var previews: some View {
        GameStart(gm: GameBoard())
    }
}
