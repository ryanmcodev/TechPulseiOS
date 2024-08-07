//
//  TPCreateAccount.swift
//  TechPulse
//
//  Created by RyanM on 8/7/24.
//

import SwiftUI

struct TPCreateAccount: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var disabled: Bool = false
    @State private var toConfirmAccount: Bool = false
    
    var body: some View {
        ScrollView {
            Grid(verticalSpacing: 20) {
                GridRow {
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 120)
                }
                
                GridRow {
                    VStack(spacing: 20) {
                        Text("Create account")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(.bold)
                        Button(action: popAction) {
                            Text("Already have an account? Sign In")
                                .font(.subheadline)
                                .fontWeight(.regular)
                        }
                        .tint(Color(hex:"FF2E3D"))
                    }
                }
                
                GridRow {
                    TextFieldHeader(
                        title: "Email Address",
                        keyboard: .emailAddress,
                        text: $email
                    )
                }

                GridRow {
                    TextFieldHeader(
                        title: "Fullname",
                        keyboard: .alphabet,
                        validation: .nonEmpty,
                        text: $email
                    )
                }

                GridRow {
                    SecureTextField(
                        title: "Password",
                        text: $password
                    )
                }

                GridRow {
                    SecureTextField(
                        title: "Re-enter password",
                        text: $password
                    )
                }

                GridRow {
                    ButtonProminent(
                        title: "Submit",
                        disable: disabled,
                        action: submitAction
                    )
                }
            }
            .padding()
        }
        .navigationDestination(isPresented: $toConfirmAccount) {
            TPConfirmAccount()
        }
    }
    
    private func popAction() {
        dismiss()
    }
    
    private func submitAction() {
        toConfirmAccount = true
    }
}

#Preview {
    TPCreateAccount()
}
