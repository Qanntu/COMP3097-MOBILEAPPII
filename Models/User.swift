//
//  User.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import Foundation

struct User: Codable, Identifiable {
    var id = UUID()
    var name: String
    var email: String
    var password: String
}

