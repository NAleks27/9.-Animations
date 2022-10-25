//
//  Animation.swift
//  Animations
//
//  Created by Aleksey Nosik on 09.10.2022.
//

import SwiftUI

struct Animation: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            HStack {
                Button("Cancel") {
                    animationAmount += 1
                }
                .padding(50)
                .background(.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .scaleEffect(animationAmount)
                .blur(radius: (animationAmount - 1) * 3)
                .animation(.default, value: animationAmount)
                
                Button("Cancel") {
                    animationAmount += 1
                }
                .padding(50)
                .background(.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .scaleEffect(animationAmount)
                //.blur(radius: (animationAmount - 1) * 3)
                .animation(
                    .easeOut(duration: 2)
                    .delay(1)             // задержка
                        .repeatCount(3, autoreverses: true),  // кол-во раз (.repeatForever - бесконечно)
                    value: animationAmount)
                .animation(.interpolatingSpring(stiffness: 50, damping: 1), value: animationAmount)
            }
            .padding(.bottom, 100)
            
            Button("Cancel") {
                //animationAmount += 1
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(Circle())
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeOut(duration: 2)
                        .repeatForever(autoreverses: false),
                        value: animationAmount)
            )
        }
        .onAppear {
            animationAmount = 2
        }
    }
}

struct Animation_Previews: PreviewProvider {
    static var previews: some View {
        Animation()
    }
}
