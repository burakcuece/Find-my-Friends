//
//  Authentication.swift
//  Find my Friends
//
//  Created by Burak Cüce on 25.05.22.
//

import SwiftUI

class Authentication: ObservableObject {
    @Published var isValidated = false
    
    func updateValidation(success: Bool) {
        withAnimation {
            isValidated = success
        }
    }
}
