//
//  TPTabControl.swift
//  TechPulse
//
//  Created by RyanM on 8/13/24.
//

import SwiftUI

struct TPTabControl: View {
    
    var homeAction: () -> Void
    var writeAction: () -> Void
    var profileAction: () -> Void
    
    @State private var homeSelect: Bool = true
    @State private var writeSelect: Bool = false
    @State private var profileSelect: Bool = false
    
    var body: some View {
        HStack {
            TPCustomButtonIcon(
                title: "Home",
                image: "HomeIcon", 
                isSelected: $homeSelect,
                action: homeTap
            )
            .padding(.leading)
            
            Spacer()
            
            TPCustomButtonIcon(
                title: "Write",
                image: "WriteIcon",
                isSelected: $writeSelect,
                action: postTap
            )
            
            Spacer()
            
            TPCustomButtonIcon(
                title: "Profile",
                image: "UserIcon",
                isSelected: $profileSelect,
                action: profileTap
            )
            .padding(.trailing)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: 60)
        .background(Color.black)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: 30))
        .padding([.leading, .trailing], 20)
    }
    
    private func homeTap() {
        homeSelect = true
        writeSelect = false
        profileSelect = false
        homeAction()
    }
    
    private func postTap() {
        homeSelect = false
        writeSelect = true
        profileSelect = false
        writeAction()
    }
    
    private func profileTap() {
        homeSelect = false
        writeSelect = false
        profileSelect = true
        profileAction()
    }
}

#Preview {
    TPTabControl(
        homeAction: {},
        writeAction: {},
        profileAction: {}
    )
}
