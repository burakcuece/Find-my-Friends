//
//  ContentView.swift
//  Find my Friends
//
//  Created by Burak Cüce on 19.05.22.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct ContentView : View {
    
    @AppStorage("log_Status") var log_Status = false
    
    var body: some View {
        
        if log_Status {
            
            NavigationView {
                VStack(spacing: 15) {
                    Text("Logged In")
                    
                    Button("Logout") {
                        GIDSignIn.sharedInstance.signOut()
                        try? Auth.auth().signOut()
                        
                        withAnimation {
                            log_Status = false
                        }
                    }
                }
            }
        }
        else {
            HomeView()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
