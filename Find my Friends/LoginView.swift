//
//  LoginView.swift
//  Find my Friends
//
//  Created by Burak Cüce on 19.05.22.
//

import SwiftUI

struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            
            Color(UIColor.systemBackground)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Willkommen!")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.bottom, 20)
                
                Image(systemName: "person.2.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .clipped()
                    .foregroundColor(.blue)
                    .opacity(0.8)
                
                Text("Find my Friends")
                    .font(.title2)
                    .fontWeight(.medium)
                    .padding(.bottom, 75)
                
                TextField("Benutzername", text: $username)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                SecureField("Passwort", text: $password)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(5.0)
                    .padding(.bottom, 20)
                
                Button {
                    print("Login")
                } label: {
                    Text("Login")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 150, height: 60)
                        .background(Color.blue)
                        .opacity(0.8)
                        .cornerRadius(25)
                }
            }
            .padding()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            
            
            
    }
}
