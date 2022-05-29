//
//  Authentication.swift
//  Find my Friends
//
//  Created by Burak Cüce on 25.05.22.
//

import SwiftUI

class Authentication: ObservableObject {
    
    @Published var isValidated = false
    
    enum AuthenticationError: Error, LocalizedError, Identifiable {
        case invalidCredentials
        
        var id: String {
            self.localizedDescription
        }
        
        var errorDescription: String? {
            switch self {
            case .invalidCredentials :
                return NSLocalizedString("Entweder ist Ihre E-Mail-Adresse oder Ihr Passwort falsch. Bitte versuche es erneut.", comment: "")
            }
        }
    }
    
    func updateValidation(success: Bool) {
            withAnimation {
                isValidated = success
        }
    }
}
