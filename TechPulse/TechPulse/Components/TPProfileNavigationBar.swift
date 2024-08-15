//
//  TPProfileNavigationBar.swift
//  TechPulse
//
//  Created by RyanM on 8/16/24.
//

import SwiftUI

struct TPMenuItem: View {
    var title: String
    var image: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(image)
                Text(title)
            }
        }
    }
}

struct TPProfileNavigationBar: View {
    var editAction: () -> Void
    var signOutAction: () -> Void
    var body: some View {
        HStack(alignment: .top) {
            UserProfileComponent(
                image: "PersonIcon",
                name: "Erika Albright",
                status: "8 min read July 5, 2024"
            )
            Spacer()
            Menu {
                TPMenuItem(
                    title: "Edit Profile",
                    image: "UserGearIcon",
                    action: editAction
                )
                
                TPMenuItem(
                    title: "Sign out",
                    image: "SignOutIcon",
                    action: signOutAction
                )
                
            } label: {
                Image(systemName: "gearshape")
                    .foregroundStyle(Color.gray)
            }
        }
    }
}

#Preview {
    TPProfileNavigationBar(editAction: {}, signOutAction: {})
}
