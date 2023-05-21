//
//  Match.swift
//  memoryApp
//
//  Created by Idress BENCHELLALI on 16/04/2023.
//

import SwiftUI

struct Anime: View {
    
    @State private var isAnimating = false
    var name: String
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .scaleEffect(isAnimating ? 1.2 : 1.0)
            .animation(.easeInOut(duration: 0.5))
            .onAppear {
                self.isAnimating = true
            }
    }
}


struct Match_Previews: PreviewProvider {
    static var previews: some View {
        Anime(name: "match")
    }
}
