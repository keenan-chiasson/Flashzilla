//
//  ContentView.swift
//  Flashzilla
//
//  Created by Keenan Chiasson on 8/3/23.
//

import CoreHaptics
import SwiftUI

struct ContentView: View {
    let timer = Timer.publish(every: 1, tolerance: 0.5,  on: .main, in: .common).autoconnect()
    @State private var counter = 0
    
    var body: some View {
        Text("Hello, world")
            .onReceive(timer) { time in
                if counter == 5 {
                    timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                }
                
                counter += 1
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
