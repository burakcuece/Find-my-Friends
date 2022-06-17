//
//  FindFriendView.swift
//  Friends
//
//  Created by Burak Cüce on 03.06.22.
//

import SwiftUI

struct FindFriendView: View {
    var body: some View {
        
        NavigationView {
            
            
            ForEach(0..<1) { _ in
                
                List {
                    FindFriendRowView()
                }
                
            }
            .navigationTitle("Freunde finden")
            .listStyle(PlainListStyle())
        }
    }
}

struct FindFriendView_Previews: PreviewProvider {
    static var previews: some View {
        FindFriendView()
    }
}
