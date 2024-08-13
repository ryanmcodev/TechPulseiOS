//
//  TPCustomButtonIcon.swift
//  TechPulse
//
//  Created by RyanM on 8/13/24.
//

import SwiftUI

struct TPCustomButtonIcon: View {
    var title: String
    var image: String
    var action: () -> Void
    var body: some View {
        Button(action: buttonAction) {
            VStack {
                Image(image)
                    .frame(width: 17, height: 17)
                Text(title)
                    .font(.caption)
                    .fontWeight(.light)
            }
        }
        .offset(y:5)
    }
    
    func buttonAction() {
        action()
    }
}

#Preview {
    TPCustomButtonIcon(title: "", image: "", action: {})
}
