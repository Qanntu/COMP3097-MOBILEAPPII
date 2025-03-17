//
//  BottomTabBar.swift
//  HocusFocusApp
//
//  Created by liz arbieto on 2025-02-16.
//

import SwiftUI

struct BottomTabBarProject: View {
    var userId: String //userId is required
    @Binding var showCreateProject: Bool

    var body: some View {
        HStack {
            Button(action: { showCreateProject = true }) {
                VStack {
                    Image(systemName: "plus.circle.fill")
                        .font(.largeTitle)}
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .foregroundColor(.gray)
        .background(Color(red: 0.15, green: 0.18, blue: 0.20))
    }
}
