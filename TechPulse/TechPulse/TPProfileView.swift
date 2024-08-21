//
//  TPProfileView.swift
//  TechPulse
//
//  Created by RyanM on 8/16/24.
//

import SwiftUI
import Observation

@Observable
final class TPProfileViewModel {
    var firstName: String = "tomioka"
    var lastName: String = "giyuu"
    var position: String = "Fullstack Developer"
    var about: String = "Full Stack Developer with 6+ years of hands-on experience designing, developing, and implementing applications and solutions using a range of technologies and programming languages. Seeking to leverage broad development experience and hands-on technical expertise in a challenging role as a Full Stack Developer."
}

struct TPProfileView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var vm = TPProfileViewModel()
    @State private var photoOptions: Bool = false
    
    var body: some View {
        ScrollView {
            Grid(alignment: .leading, verticalSpacing: 20) {
                GridRow {
                    UserHyperlink(
                        image: "PersonIcon",
                        updateAction: chooseImageAction
                    )
                }
                
                GridRow {
                    Text("tomioka.giyuu@codev.com")
                        .font(.headline)
                }
                
                GridRow {
                    TextFieldHeader(
                        title: "First name",
                        fontweight: .semibold,
                        keyboard: .alphabet,
                        validation: .nonEmpty,
                        text: $vm.firstName
                    )
                }
                
                GridRow {
                    TextFieldHeader(
                        title: "Last name",
                        fontweight: .semibold,
                        keyboard: .alphabet,
                        validation: .nonEmpty,
                        text: $vm.lastName
                    )
                }

                GridRow {
                    TextFieldHeader(
                        title: "Position",
                        fontweight: .semibold,
                        keyboard: .alphabet,
                        validation: .nonEmpty,
                        text: $vm.position
                    )
                }

                GridRow {
                    TextEditorHeader(
                        title: "About me",
                        text: $vm.about
                    )
                }
            }
        }
        .padding([.leading, .trailing], 20)
        .navigationBarBackButtonHidden()
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button(action: backAction) {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(Color.black)
                }
            }
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: editAction) {
                    Text("Update")
                        .fontWeight(.light)
                }
                .tint(Color(hex: "FF2E3D"))
                .buttonStyle(.borderedProminent)
            }
        }
        .sheet(isPresented: $photoOptions) {
            TPPhotoOptionsView(
                cameraAction: cameraAction,
                galleryAction: galleryAction
            )
            .presentationDetents([.height(250)])
        }

    }
    
    private func chooseImageAction() {
        photoOptions = true
    }
    
    private func cameraAction() {

    }

    private func galleryAction() {

    }

    private func editAction() {
        dismiss()
    }
    
    private func backAction() {
        dismiss()
    }
}

#Preview {
    NavigationStack {
        TPProfileView()
    }
}
