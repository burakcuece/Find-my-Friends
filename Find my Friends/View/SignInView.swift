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
    
    @State var showingDetail = false

    @StateObject private var loginVM = LoginViewModel()
    @EnvironmentObject var authentication: Authentication
    
    @AppStorage("log_Status") var log_Status = false
    
    var body: some View {
        
            VStack {
                
                HStack {
                    
                    VStack (alignment: .leading, spacing: 15) {
                        
                        Text("E-Mail / Nutzername")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        
                        TextField("E-Mail / Nutzername", text: $loginVM.credentials.email)
                            .keyboardType(.emailAddress)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(0.5)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                            .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                        
                        Text("Passwort")
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        
                        SecureField("Passwort", text: $loginVM.credentials.password)
                        
                            .padding()
                            .background(Color.white)
                            .cornerRadius(0.5)
                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 5)
                            .shadow(color: Color.black.opacity(0.08), radius: 5, x: 0, y: -5)
                        
                        if loginVM.showProgressView {
                            ProgressView()
                        }
                        
                        Button(action: {
                            self.showingDetail.toggle()
                        }) {
                            Text("Passwort vergessen?")
                                .font(.system(size: 14))
                                .fontWeight(.bold)
                                .foregroundColor(Color.blue)
                        }.sheet(isPresented: $showingDetail, content: {
                            
                            ForgotPasswordView()
                        })
                        .padding(.top,10)
                    }
                }
                .padding(.horizontal,25)
                .padding(.top, 30)
                
                Button("Login") {
                    DispatchQueue.main.async {
                        loginVM.login { success in
                            authentication.updateValidation(success: success)
                        }
                    }
                }
                .disabled(loginVM.loginDisabled)
                .font(.system(size: 20))
                .foregroundColor(.white)
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 50)
                .background(Color.blue)
                .cornerRadius(8)
                .onTapGesture {
                    UIApplication.shared.endEditing()
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
                            
                            Text("Continue with Google")
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
            
            .autocapitalization(.none)
            .disabled(loginVM.showProgressView)
            .alert(item: $loginVM.error) { error in
                Alert(title: Text("Ungültige Anmeldung"), message: Text(error.localizedDescription))
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
