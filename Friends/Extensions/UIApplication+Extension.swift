//
//  UIApplication+Extension.swift
//  Friends
//
//  Created by Burak Cüce on 25.05.22.
//

import UIKit

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
