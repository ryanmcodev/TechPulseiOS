//
//  UserProfileComponent.swift
//  TechPulse
//
//  Created by RyanM on 8/23/24.
//

import SwiftUI

struct UserProfileComponent: View {
    var image: String
    var name: String
    var status: String
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(name)
                    .fontWeight(.bold)
                Text(status)
                    .font(.caption)
                    .fontWeight(.light)
            }
        }
    }
}

#Preview {
    UserProfileComponent(image: "", name: "", status: "")
}
