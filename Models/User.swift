//
//  User.swift
//  HocusFocusApp
//
//  Created by liz cruz
//  Student ID: 101470163

import Foundation

struct User: Codable, Identifiable {
    var id = UUID()
    var name: String
    var email: String
    var password: String
}

