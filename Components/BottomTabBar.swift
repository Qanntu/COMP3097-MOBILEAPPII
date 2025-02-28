//
//  BottomTabBar.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import SwiftUI

struct BottomTabBar: View {
    var body: some View {
        HStack {
            Button(action: {}) {
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                        .font(.caption)
                }
            }
            .frame(maxWidth: .infinity)
            
            Button(action: {}) {
                VStack {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)
                }
            }
            .frame(maxWidth: .infinity)
            
            Button(action: {}) {
                VStack {
                    Image(systemName: "bell")
                    Text("Notifications")
                        .font(.caption)
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .background(Color(UIColor.systemGray6))
    }
}
