//
//  AnimationViewsTransitions.swift
//  Animations
//
//  Created by Aleksey Nosik on 09.10.2022.
//

import SwiftUI

struct AnimationViewsTransitions: View {
   
    @State private var isShowingRed = false
    
    var body: some View {
        VStack {
            Button("Tap me") {
                withAnimation {
                    isShowingRed.toggle()
                }
            }
            
            if isShowingRed {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    //.transition(.scale) // уменьшение и увеличение
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))

            }
        }
        
    }
}

struct AnimationViewsTransitions_Previews: PreviewProvider {
    static var previews: some View {
        AnimationViewsTransitions()
    }
}
