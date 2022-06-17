//
//  View+Extension.swift
//  Friends
//
//  Created by Burak Cüce on 20.05.22.
//

import SwiftUI

extension View{
    func getRect()-> CGRect {
        return UIScreen.main.bounds
    }
    
    //    Retreiving RootView Controller
    func getRootViewController()->UIViewController {
        
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        return root
    }
}
