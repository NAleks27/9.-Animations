//
//  Animation3D.swift
//  Animations
//
//  Created by Aleksey Nosik on 09.10.2022.
//

import SwiftUI

struct Animation3D: View {
    // ось X - объект вращается вверх или вниз
    // ось Y - влево или вправо
    // ось Z - по часовой или против
    
    @State private var animationAmount = 0.0
    @State private var enabled = false
    
    var body: some View {
        VStack {
            Button("Button 1") {
                withAnimation(.interpolatingSpring(stiffness: 5, damping: 1)) {
                    animationAmount += 360
                }
            }
            .padding(50)
            .background(AngularGradient(colors: [.cyan, .blue, .red, .cyan], center: .center))
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(animationAmount), axis: (x: 0, y: 1, z: 0))
            .padding(.bottom, 30)
            
            HStack {
                Button("Button 2") {
                    enabled.toggle()
                }
                .frame(width: 100, height: 100)
                .background(enabled ? .blue : .red)
                .foregroundColor(.white)
                .animation(.default, value: enabled)
                .clipShape(RoundedRectangle(cornerRadius: enabled ? 30 : 0))
                .padding(.trailing, 30)
                
                Button("Button 3") {
                    enabled.toggle()
                }
                .frame(width: 100, height: 100)
                .background(enabled ? .blue : .red)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: enabled ? 30 : 0))
                .animation(.default, value: enabled)
                .padding(.trailing, 30)
                
                Button("Button 4") {
                    enabled.toggle()
                }
                .frame(width: 100, height: 100)
                .background(enabled ? .blue : .red)
                .animation(.default, value: enabled)
                .foregroundColor(enabled ? .black : .white)
                .animation(nil, value: enabled)  // если хотим чтобы цвет теста менялся мгновенно
                .clipShape(RoundedRectangle(cornerRadius: enabled ? 30 : 0))
                .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
            }
        }
    }
}

struct Animation3D_Previews: PreviewProvider {
    static var previews: some View {
        Animation3D()
    }
}
