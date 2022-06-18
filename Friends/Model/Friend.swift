//
//  Friend.swift
//  Friends
//
//  Created by Burak Cüce on 18.06.22.
//

import SwiftUI
import Foundation

struct Friend: Identifiable {
    var id = UUID().uuidString
    var friendName: String
    var friendImage: String
    var isLiked: Bool = false
}

var friends: [Friend] = [
    Friend(friendName: "Laura Mustermann", friendImage: "Profil-2", isLiked: true)
]
