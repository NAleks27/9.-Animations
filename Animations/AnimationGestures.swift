//
//  AnimationGestures.swift
//  Animations
//
//  Created by Aleksey Nosik on 09.10.2022.
//

import SwiftUI

struct AnimationGestures: View {
    
    @State private var dragAmount = CGSize.zero
   
    @State private var enabled = false
    @State private var amountOfDrag = CGSize.zero
    
    let letters = Array("Hello, world")

    var body: some View {
            VStack {
                LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(width: 300, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .offset(dragAmount)
                    .gesture(
                        DragGesture()
                            .onChanged { dragAmount = $0.translation }
                            .onEnded { _ in dragAmount = .zero }
                    )
                    .animation(.spring(), value: dragAmount)    // плавное движение
            
                LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .frame(width: 300, height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .offset(dragAmount)
                    .gesture(
                        DragGesture()
                            .onChanged { dragAmount = $0.translation }
                            .onEnded { _ in
                                withAnimation {
                                    dragAmount = .zero  // анимация только на возврат
                                }
                            }
                    )
                    .padding(.bottom, 30)
                
                
                HStack(spacing: 0) {
                    ForEach(0..<letters.count) { num in
                        Text(String(letters[num]))
                            .padding(7)
                            .font(.title)
                            .background(enabled ? .blue : .red)
                            .offset(amountOfDrag)
                            .animation(
                                .default.delay(Double(num) / 20),
                                value: amountOfDrag)
                    }
                }
                .gesture(
                    DragGesture()
                        .onChanged { amountOfDrag = $0.translation }
                        .onEnded { _ in
                            amountOfDrag = .zero
                            enabled.toggle()
                        }
                )
            }
    }
}

struct AnimationGestures_Previews: PreviewProvider {
    static var previews: some View {
        AnimationGestures()
    }
}
