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
    
    var body: some View {
        HStack {
            TPCustomButtonIcon(
                title: "Home",
                image: "HomeIcon",
                action: homeAction
            )
            .padding(.leading)
            
            Spacer()
            
            TPCustomButtonIcon(
                title: "Write",
                image: "WriteIcon",
                action: writeAction
            )
            
            Spacer()
            
            TPCustomButtonIcon(
                title: "Profile",
                image: "UserIcon",
                action: profileAction
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
}
#Preview {
    TPTabControl(
        homeAction: {},
        writeAction: {},
        profileAction: {}
    )
}
