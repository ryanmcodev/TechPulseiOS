//
//  TechPulseMain.swift
//  TechPulse
//
//  Created by RyanM on 8/7/24.
//

import SwiftUI


struct TechPulseMain: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var disabled: Bool = false
    @State private var toDashBoard: Bool = false
    @State private var toCreateAccount: Bool = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Grid(verticalSpacing: 20) {
                    GridRow {
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 120)
                    }
                    
                    GridRow {
                        Text("Sign In")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(.bold)
                    }
                    
                    GridRow {
                        TextFieldHeader(
                            title: "Email Address",
                            keyboard: .emailAddress,
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
                        HStack {
                            Button(action: forgotPasswordAction) {
                                Text("Forgot Password")
                                    .fontWeight(.light)
                            }
                            Spacer()
                            Button(action: createAccountAction) {
                                Text("Create Acccount")
                                    .fontWeight(.light)
                                    .foregroundColor(Color(hex: "FF2E3D"))
                            }
                        }
                    }
                    
                    GridRow {
                        ButtonProminent(
                            title: "Sign In",
                            disable: disabled,
                            action: signInAction
                        )
                    }
                }
                .padding()
            }
            .navigationDestination(isPresented: $toCreateAccount) {
                TPCreateAccount()
            }
            .navigationDestination(isPresented: $toDashBoard) {
                TPDashBoard()
            }
        }
    }
    
    private func forgotPasswordAction() {
        
    }
    
    private func createAccountAction() {
        toCreateAccount = true
    }
    
    private func signInAction() {
        toDashBoard = true
    }
}

#Preview {
    TechPulseMain()
}
