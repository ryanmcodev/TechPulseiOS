//
//  TPFilterView.swift
//  TechPulse
//
//  Created by RyanM on 8/13/24.
//

import SwiftUI

struct TPFilterView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            HStack {
                Text("Events")
                Text("Games")
                Text("Sports")
                Text("Technology")
            }
            .toolbar {
                ToolbarItem(placement: .topBarLeading) { headerText }
                ToolbarItem(placement: .topBarTrailing) { cancelButton }
            }
        }
    }
    
    var headerText: some View {
        Text("Pick filter by")
            .fontWeight(.medium)
    }
    
    var cancelButton: some View {
        Button(action: cancelAction) {
            Text("CANCEL")
                .fontWeight(.bold)
        }
        .tint(Color(hex: "FF2E3D"))
    }
    
    private func cancelAction() {
        dismiss()
    }
}

#Preview {
    TPFilterView()
}
