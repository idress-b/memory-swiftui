//
//  SwiftUIView.swift
//  memoryApp
//
//  Created by Idress BENCHELLALI on 15/04/2023.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var card: Card
    
    var body: some View {
        
       GeometryReader { geo in
            ZStack(alignment: .center) {
                if card.isFlipped {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.white)
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 3)
                    Text(card.name)
                        .font(.system(size: geo.size.width * 0.5))
                        .padding()
                    
                } else {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.white]), startPoint: .topLeading, endPoint: .bottomTrailing)
)
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 3)
                    Image("brain")
                        .resizable()
                        .scaledToFit()
                        .padding()
                }
            }
            .aspectRatio(0.75, contentMode: .fit)
            .rotation3DEffect(Angle(degrees: card.isFlipped ? 0 : 180),
                              axis: (x: 0.0, y: 1.0, z: 0.0))
            .animation(.easeInOut(duration: 0.4),value: card.isFlipped)
            
        }
        
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HStack{
            ForEach(0..<4) {_ in
                CardView(card: Card(name: "🤡"))
                    
                    
            }
        }
        
        
    }
}
