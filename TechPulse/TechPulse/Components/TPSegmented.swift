//
//  TPSegmented.swift
//  TechPulse
//
//  Created by RyanM on 8/16/24.
//

import SwiftUI

struct TPSegmented: View {
    var menu1: String
    var menu2: String
    
    var body: some View {
        HStack {
            Text(menu1)
                .font(.headline)
                .padding([.trailing], 20)
            Text(menu2)
            Spacer()
        }
        .padding([.top, .bottom], 10)
    }
}

#Preview {
    TPSegmented(menu1: "Top Posts", menu2: "Recents")
}
