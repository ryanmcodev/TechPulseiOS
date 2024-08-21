//
//  TPPhotoOptionsView.swift
//  TechPulse
//
//  Created by RyanM on 8/16/24.
//

import SwiftUI

struct TPPhotoOptionItem: View {
    var title: String
    var image: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: image)
                Text(title)
                Spacer()
            }
        }
        .tint(.black)
        .padding([.top,.bottom])
    }
}

struct TPPhotoOptionsView: View {
    @Environment(\.dismiss) private var dismiss
    
    var cameraAction: () -> Void
    var galleryAction: () -> Void
    
    private let columns = [GridItem(.adaptive(minimum: 90, maximum: 80))]
    var body: some View {
        VStack {
            Capsule(style: .continuous)
                .foregroundStyle(.black)
                .frame(width: 100, height: 10)
            HStack {
                headerText
                Spacer()
                cancelButton
            }
            ScrollView {
                Grid {
                    GridRow {
                        TPPhotoOptionItem(
                            title: "Take photo",
                            image: "camera",
                            action: takePhotoAction
                        )
                    }
                    
                    GridRow {
                        TPPhotoOptionItem(
                            title: "Choose from gallery",
                            image: "photo",
                            action: takePhotoAction
                        )
                    }
                }
            }
        }
        .padding()
    }
    
    var headerText: some View {
        Text("Choos a profile image")
            .fontWeight(.medium)
    }
    
    var cancelButton: some View {
        Button(action: cancelAction) {
            Text("CANCEL")
                .fontWeight(.bold)
        }
        .tint(Color(hex: "FF2E3D"))
    }
    
    private func takePhotoAction() {
        cameraAction()
        dismiss()
    }
    
    private func chooseFromGallery() {
        galleryAction()
        dismiss()
    }
    
    private func cancelAction() {
        dismiss()
    }
}
#Preview {
    TPPhotoOptionsView(cameraAction: {}, galleryAction: {})
}
