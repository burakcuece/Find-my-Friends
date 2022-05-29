//
//  ContentView.swift
//  Find my Friends
//
//  Created by Burak Cüce on 28.05.22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var authentication = Authentication()

    var body: some View {
        Group {
            if authentication.isValidated {
                MapView()
                    .environmentObject(authentication)
            } else {
                HomeView()
                    .environmentObject(authentication)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
