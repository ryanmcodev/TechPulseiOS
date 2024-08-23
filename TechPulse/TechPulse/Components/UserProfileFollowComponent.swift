//
//  UserProfileFollowComponent.swift
//  TechPulse
//
//  Created by RyanM on 8/23/24.
//

import SwiftUI

struct UserProfileFollowComponent: View {
    var image: String
    var name: String
    var status: String
    var followAction: () -> Void
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                HStack {
                    Text(name)
                        .fontWeight(.regular)
                    Button(action: followAction) {
                        Text("Follow")
                            .fontWeight(.regular)
                            .foregroundStyle(Color(hex: "FF2E3D"))
                    }
                }
                Text(status)
                    .font(.caption)
                    .fontWeight(.light)
            }
        }
    }
}
#Preview {
    UserProfileFollowComponent(image: "", name: "", status: "", followAction: {})
}
