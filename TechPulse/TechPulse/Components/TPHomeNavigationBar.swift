//
//  TPHomeNavigationBar.swift
//  TechPulse
//
//  Created by RyanM on 8/16/24.
//

import SwiftUI

struct TPHomeNavigationBar: View {
    var tagAction: () -> Void
    var bellAction: () -> Void
    
    var body: some View {
        HStack {
            Text("Home")
                .font(.largeTitle)
                .fontWeight(.heavy)
            Spacer()
            Button(action: tagAction) {
                Image("TagIcon")
            }
            Button(action: bellAction) {
                Image("BellIcon")
            }
        }
    }
}

#Preview {
    TPHomeNavigationBar(tagAction: {}, bellAction: {})
}
