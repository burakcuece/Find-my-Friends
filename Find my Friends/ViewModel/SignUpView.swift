//
//  SignUpView.swift
//  Find my Friends
//
//  Created by Burak Cüce on 22.05.22.
//

import SwiftUI

struct SignUpView : View {
    
    @State var username = ""
    @State var password = ""
    @State var email = ""
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                VStack (alignment: .leading, spacing: 15) {
                    
                    Text("E-Mail")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    TextField("E-Mail", text: $email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(0.5)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                    
                }
            }
            .padding(.horizontal,25)
            .padding(.top, 25)
            
            VStack (alignment: .leading, spacing: 15) {
                
                Text("Nutzername")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                TextField("Nutzername", text: $username)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(0.5)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                
            }
        
        .padding(.horizontal,25)
        .padding(.top, 30)
            
            VStack(alignment: .leading, spacing: 15) {
                
                Text("Passwort")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundColor(.gray)
                
                SecureField("Passwort", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(0.5)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                    .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                
            }
            .padding(.horizontal,25)
            .padding(.top)
            
            Button(action: {
                
            }) {
                Text("Registrieren")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
                    .background(
                        
                        Color.blue
                    )
                    .cornerRadius(8)
            }
            
            .padding(.horizontal, 25)
            .padding(.top, 25)
        }
    }
}


struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
