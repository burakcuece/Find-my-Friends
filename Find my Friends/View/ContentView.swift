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
        TabView {
            MapView()
                .tabItem {
                    Label("Karte", systemImage: "map.fill")
                }
            FindFriendView()
                .tabItem {
                    Label("Freunde finden", systemImage: "person.2.fill")
                }
            ChatView()
                .tabItem {
                    Label("Nachrichten", systemImage: "message.fill")
                }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
