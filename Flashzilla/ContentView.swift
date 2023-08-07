//
//  ContentView.swift
//  Flashzilla
//
//  Created by Keenan Chiasson on 8/3/23.
//

import CoreHaptics
import SwiftUI

struct ContentView: View {
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @State private var scale = 1.0
    
    var body: some View {
        HStack {
            if differentiateWithoutColor {
                Image(systemName: "checkmark.circle")
            }
            
            Text("Success")
                .background(reduceTransparency ? .black : .black.opacity(0.5))
                .foregroundColor(.white)
                .clipShape(Capsule())
        }
        .padding()
        .background(differentiateWithoutColor ? .black : .green)
        .foregroundColor(.white)
        .clipShape(Capsule())
        .scaleEffect(scale)
        .onTapGesture {
            withOptionalAnimation {
                scale *= 1.5
            }
        }
    }
    
    func withOptionalAnimation<Result>(_ animation: Animation? = .default, body: () throws -> Result) rethrows -> Result {
        if UIAccessibility.isReduceMotionEnabled {
            return try body()
        } else {
            return try withAnimation(animation, body)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
