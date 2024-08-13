//
//  TPCreateAccount.swift
//  TechPulse
//
//  Created by RyanM on 8/7/24.
//

import SwiftUI
import Observation

@Observable
final class TPCreateAccountViewModel {
    var email: String = ""
    var firstName: String = ""
    var lastName: String = ""
    var password: String = ""
    var confirmPassword: String = ""
    var disabled: Bool = false
    var toConfirmAccount: Bool = false
}

extension TPCreateAccountViewModel {
    
    func submitData() {
        toConfirmAccount = true
    }
}

struct TPCreateAccount: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var vm = TPCreateAccountViewModel()
        
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
                        text: $vm.email
                    )
                }

                GridRow {
                    TextFieldHeader(
                        title: "First name",
                        keyboard: .alphabet,
                        validation: .nonEmpty,
                        text: $vm.firstName
                    )
                }

                GridRow {
                    TextFieldHeader(
                        title: "Last name",
                        keyboard: .alphabet,
                        validation: .nonEmpty,
                        text: $vm.lastName
                    )
                }

                GridRow {
                    SecureTextField(
                        title: "Password",
                        text: $vm.password
                    )
                }

                GridRow {
                    SecureTextField(
                        title: "Re-enter password",
                        text: $vm.confirmPassword
                    )
                }

                GridRow {
                    ButtonProminent(
                        title: "Submit",
                        disable: vm.disabled,
                        action: submitAction
                    )
                }
            }
            .padding()
        }
        .navigationDestination(isPresented: $vm.toConfirmAccount) {
            TPConfirmAccount()
        }
    }
    
    private func popAction() {
        dismiss()
    }
    
    private func submitAction() {
        vm.submitData()
    }
}

#Preview {
    TPCreateAccount()
}
