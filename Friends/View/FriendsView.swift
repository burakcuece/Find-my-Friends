//
//  FriendsView.swift
//  Friends
//
//  Created by Burak Cüce on 03.06.22.
//

import SwiftUI

struct FriendsView: View {
    var body: some View {
        
        NavigationView {
            
            
            ForEach(0..<1) { _ in
                
                List {
                    FriendsRowView()
                }
                
            }
            .navigationTitle("Freunde finden")
            .listStyle(PlainListStyle())
        }
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}
