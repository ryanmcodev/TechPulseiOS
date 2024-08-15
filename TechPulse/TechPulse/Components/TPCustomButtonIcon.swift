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
    @Binding var isSelected: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: buttonAction) {
            VStack {
                Image(image)
                    .renderingMode(.template)
                    .frame(width: 17, height: 17)
                Text(title)
                    .font(.caption)
                    .fontWeight(.light)
            }
            .foregroundStyle(highLight)
        }
        .offset(y:5)
    }
    
    private var highLight: Color {
        isSelected ? Color(hex: "FF2E3D") : Color.white
    }
    
    func buttonAction() {
        action()
    }
}

#Preview {
    TPCustomButtonIcon(
        title: "",
        image: "",
        isSelected: .constant(true),
        action: {}
    )
}
