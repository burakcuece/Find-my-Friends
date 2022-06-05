//
//  Credentials.swift
//  Find my Friends
//
//  Created by Burak Cüce on 25.05.22.
//

import Foundation

struct Credentials: Codable {
    @State var email: String = ""
    @State var password: String = ""
}
