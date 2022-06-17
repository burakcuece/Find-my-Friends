//
//  SignUpView.swift
//  Friends
//
//  Created by Burak Cüce on 22.05.22.
//

import SwiftUI

struct SignUpView : View {

    @State var showingDetail = false
    @State private var isPresented = false
    
    
    @StateObject private var registerVM = RegisterViewModel()
    @EnvironmentObject var authentication: Authentication
    
    var body: some View {
        
        VStack {
            
            HStack {
                
                VStack (alignment: .leading, spacing: 15) {
                    
                    Text("Nutzername")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    TextField("Nutzername", text: $registerVM.credentials.username)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(0.5)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                    
                    
                    
                    
                    Text("E-Mail")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    TextField("E-Mail", text: $registerVM.credentials.email)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(0.5)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                    
                    
                    
                    
                    
                    Text("Passwort")
                        .font(.caption)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                    
                    SecureField("Passwort", text: $registerVM.credentials.password)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(0.5)
                        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                        .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                    
                   
                    if registerVM.showProgressView {
                        ProgressView()
                    }
                    
                    Button("Registrieren") {
                        self.isPresented.toggle()
                    }
                    .fullScreenCover(isPresented: $isPresented) {
                        ContentView()
                    }
                    .disabled(registerVM.registerDisabled)
                    .font(.system(size: 20))
                    .foregroundColor(Color.white)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
                    .background(Color.blue)
                    .cornerRadius(8)
                    .onTapGesture {
                        UIApplication.shared.endEditing()
                    }
                    .autocapitalization(.none)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .disabled(registerVM.showProgressView)
                }
                .padding(.horizontal, 25)
                .padding(.top, 25)

            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
