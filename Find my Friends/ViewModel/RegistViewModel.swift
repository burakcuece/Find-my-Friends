//
//  RegistViewModel.swift
//  Find my Friends
//
//  Created by Burak Cüce on 08.06.22.
//

import Foundation

class RegisterViewModel: ObservableObject {
    
    @Published var credentials = Credentials()
    @Published var showProgressView = false
    
    var registerDisabled: Bool {
        credentials.email.isEmpty || credentials.password.isEmpty || credentials.username.isEmpty
    }
    
    func register(completion: @escaping (Bool) -> Void) {
        showProgressView = true
        APIService.shared.login(credentials: credentials) { [unowned self] (result:Result<Bool, APIService.APIError>) in
            showProgressView = false
            switch result {
            case .success:
                completion(true)
            case .failure:
                credentials = Credentials()
                completion(false)
            }
        }
    }
}
