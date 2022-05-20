//
//  LoginView.swift
//  Find my Friends
//
//  Created by Burak Cüce on 19.05.22.
//

import SwiftUI
import Firebase
import GoogleSignIn


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
                        .padding(.bottom, 20)
                }
                
                HStack {
                    
                    
                    
                    Button {
                        
                        handleLogin()
                        
                    } label: {
                        
                        HStack(spacing: 15) {
                            
                            Image("google")
                                .resizable()
                                .renderingMode(.original)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 20, height: 20)
                            
                            Text("Login with Google")
                                .font(.caption2)
                                .fontWeight(.medium)
                        }
                        .foregroundColor(.blue)
                        .opacity(0.8)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(
                            Rectangle()
                                .strokeBorder(.blue)
                                .frame(width: 160)
                        )
                    }
                }
                
            }
            .padding()
        }
    }
    
    func handleLogin() {
        
        // Google Sign in...
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign IN configuration object
        
        let config = GIDConfiguration(clientID: clientID)
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: getRootViewController())
        {[self] user, err in
            
            if let error = err {
                print(error.localizedDescription)
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authentication.accessToken)
            
            // Firebase Auth
            
            Auth.auth().signIn(with: credential) { result, err in
                
                if let error = err {
                    print(error.localizedDescription)
                    return
                }
                
                // Displaying User Name
                guard let user = result?.user else {
                    return
                }
                print(user.displayName ?? "Succes!")
            }
        }
        
    }
    
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
            
        }
    }
    
}
