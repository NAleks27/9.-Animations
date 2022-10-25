//
//  Stepper.swift
//  Animations
//
//  Created by Aleksey Nosik on 09.10.2022.
//

import SwiftUI

struct StepperAnimation: View {
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        VStack {
            VStack {
                Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
                Stepper("Scale amount", value: $animationAmount.animation(
                    .easeOut(duration: 1)
                    .repeatCount(3, autoreverses: true)  // если четное - конечная цель будет рывком
                ), in: 1...10)
                
                Spacer()
                
                Button("Tap Me") {
                    animationAmount += 1
                }
                .padding(50)
                .background(.red)
                .foregroundColor(.white)
                .clipShape(Circle())
                .scaleEffect(animationAmount)
            }
            .padding(.bottom, 100)
        }
    }
}

struct StepperAnimation_Previews: PreviewProvider {
    static var previews: some View {
        StepperAnimation()
    }
}
