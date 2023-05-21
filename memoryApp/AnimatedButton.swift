//
//  SwiftUIView.swift
//  memoryApp
//
//  Created by Idress BENCHELLALI on 16/04/2023.
//

import SwiftUI

struct AnimatedButton: View {
    @State var isAnimated: Bool = false
    var text : String
    var action: () -> Void
    var body: some View {
            Button(action: action
            ) {
                Text(text)
                    .foregroundColor(.white)
                    .font(.system(size:32))
                    .padding()
            }
            .background(Color.red)
            .cornerRadius(10)
            .scaleEffect(isAnimated ? 1.2 : 1.0)
            .animation(Animation.easeInOut(duration: 1.0).repeatForever(autoreverses: true))
            .onAppear {
                self.isAnimated = true
            }
        }
}

struct AnimatedButton_Previews: PreviewProvider {
    static var previews: some View {
        AnimatedButton(text: "NEXT LEVEL"){}
    }
}
