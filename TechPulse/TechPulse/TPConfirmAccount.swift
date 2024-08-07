//
//  TPConfirmAccount.swift
//  TechPulse
//
//  Created by RyanM on 8/7/24.
//

import SwiftUI

struct TPConfirmAccount: View {
    
    @State private var disabled: Bool = false
    @State private var toDashBoard: Bool = false
    
    var body: some View {
        Grid(verticalSpacing: 20) {
            GridRow {
                Image("HandAndMobile")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
            }
            
            GridRow {
                VStack(spacing: 20) {
                    Text("Account Created")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.bold)
                    Text("Congrats - you’re all done. You can now see articles and create your own that can inspire or share with others")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .fontWeight(.regular)
                    .tint(Color(hex:"FF2E3D"))
                }
            }
            
            GridRow {
                ButtonProminent(
                    title: "Continue",
                    disable: disabled,
                    action: continueAction
                )
            }
        }
        .toolbar(.hidden, for: .navigationBar)
        .padding()
        .navigationDestination(isPresented: $toDashBoard) {
            TPDashBoard()
        }

    }
    
    private func continueAction() {
        toDashBoard = true
    }
}

#Preview {
    TPConfirmAccount()
}
