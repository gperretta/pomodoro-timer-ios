//
//  ContentView.swift
//  Timer
//
//  Created by Gilda on 01/01/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        
        TimerView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .preferredColorScheme(.dark)
    }
}
