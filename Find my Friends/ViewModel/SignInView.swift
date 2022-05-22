//
//  SignInView.swift
//  Find my Friends
//
//  Created by Burak Cüce on 22.05.22.
//

import SwiftUI
import Firebase
import GoogleSignIn

struct SignInView : View {
    
    @State var username = ""
    @State var password = ""
    
    @AppStorage("log_Status") var log_Status = false
    
    var body: some View {
        
        VStack {
            
            HStack {
                
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
                
                
                Button(action: {
                    
                }) {
                    Text("Passwort vergessen?")
                        .font(.system(size: 14))
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                }
                .padding(.top,10)
            }
            .padding(.horizontal,25)
            .padding(.top)
            
            Button(action: {
                
            }) {
                Text("Login")
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
            
            HStack {
                
                
                VStack {
                    
                    Button(action: {
                        handleLogin()
                    }) {
                        
                        Image("google")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 28, height: 28)
                        
                        Text("Login with Google")
                            .font(.title3)
                            .fontWeight(.medium)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        Capsule()
                            .strokeBorder(Color.blue)
                    )
                }
            }
            .padding(.horizontal, 25)
            .padding(.top, 25)
        }
    
    }
    
    func handleLogin() {
        
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        let config = GIDConfiguration(clientID: clientID)
                
        GIDSignIn.sharedInstance.signIn(with: config , presenting: getRootViewController()) {[self] user, err in
            
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
            
            Auth.auth().signIn(with: credential) { result, error in
                                
                if let error = err {
                    print(error.localizedDescription)
                    return
                }
                
                guard let user = result?.user else {
                    return
                }
                print(user.displayName ?? "Success!")
                
                withAnimation {
                    log_Status = true
                }
            }
        }
    }
}


struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
