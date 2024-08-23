//
//  TechPulseMain.swift
//  TechPulse
//
//  Created by RyanM on 8/7/24.
//

import SwiftUI
import Observation

struct TechPulseMain: View {
    
    @Environment(TechPulseRouter.self) private var router: TechPulseRouter
    
    @State private var email: String = "erika.albright@techpulse.com"
    @State private var password: String = "p@$$w0rd"
    @State private var disabled: Bool = false
    @State private var toDashBoard: Bool = false
    @State private var toCreateAccount: Bool = false
    
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
//        .navigationDestination(isPresented: $toCreateAccount) {
//            TPCreateAccount()
//        }
//        .navigationDestination(isPresented: $toDashBoard) {
//            TPDashBoard()
//        }
    }
    
    private func forgotPasswordAction() {
        
    }
    
    private func createAccountAction() {
        //toCreateAccount = true
        router.push(screen: .signup)
    }
    
    private func signInAction() {
        //toDashBoard = true
        router.push(screen: .dashboard)
    }
}

#Preview {
    TechPulseMain()
}
