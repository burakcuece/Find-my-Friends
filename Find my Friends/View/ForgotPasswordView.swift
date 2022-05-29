//
//  ForgotPasswordView.swift
//  Find my Friends
//
//  Created by Burak Cüce on 29.05.22.
//

import SwiftUI

struct ForgotPasswordView: View {
    
    @State var email = ""
    @Binding var showHomeView: Bool

    
    var body: some View {
        
        
        NavigationView {
            
            VStack(alignment: .leading, spacing: 15) {
                
                Text("Geben Sie die E-Mail-Adresse ein, die Sie bei Ihrem Beitritt verwendet haben, und wir senden Ihnen Anweisungen zum Zurücksetzen Ihres Passworts.")
                    .font(.caption)
                    .fontWeight(.medium)
                
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
                
                
                Button(action: {
                    
                }) {
                    Text("Senden")
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
            }
            .navigationTitle("Passwort vergessen")
            
            .navigationBarItems(trailing: Button(action: {
                
                print("Dissmissing home view")
                
                self.showHomeView = false }) {
                    
                  Image(systemName: "x.circle")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .foregroundColor(Color.black)
                    
            })
            .padding(.horizontal, 25)
            .padding(.top, 25)
        }
        
    }
    
}

struct ForgotPasswordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPasswordView(showHomeView: .constant(false))
    }
}
