//
//  File.swift
//  Animations
//
//  Created by Aleksey Nosik on 09.10.2022.
//

import Foundation

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}
