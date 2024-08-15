//
//  TPDashBoard.swift
//  TechPulse
//
//  Created by RyanM on 8/7/24.
//

import SwiftUI

struct ProfileScreen: View {
    var editAction: () -> Void
    var signOutAction: () -> Void
    
    var body: some View {
        VStack {
            Grid {
                GridRow {
                    TPProfileNavigationBar(
                        editAction: editAction,
                        signOutAction: signOutAction
                    )
                }
                
                GridRow {
                    TPSegmented(
                        menu1: "Your Articles",
                        menu2: "Saved Articles"
                    )
                }
            }
            .padding([.leading, .trailing], 20)
            
            Divider()
            
            TPArticleListView()
        }
    }
}


enum TabMenuType {
    case home
    case post
    case profile
}

struct TPDashBoard: View {
    @State private var showFilter: Bool = false
    @State private var selectedTab: TabMenuType = .home
    @State private var gotoProfile: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            dashBoardScreen
            TPTabControl(
                homeAction: homeAction,
                writeAction: writeAction,
                profileAction: userAction
            )
        }
        .navigationDestination(isPresented: $gotoProfile) {
            TPProfileView()
        }
        .toolbar(.hidden, for: .navigationBar)
        .sheet(isPresented: $showFilter) {
            TPFilterView()
                .presentationDetents([.height(250)])
        }
    }
    
    @ViewBuilder
    var dashBoardScreen: some View {
        switch selectedTab {
        case .home:
            HomeScreen(
                tagAction: tagAction,
                bellAction: bellAction
            )

        case .post:
            HomeScreen(
                tagAction: tagAction,
                bellAction: bellAction
            )

        case .profile:
            ProfileScreen(
                editAction: editAction,
                signOutAction: signOutAction
            )
        }
    }
}

// MARK: - CTAs
extension TPDashBoard {
    
    func tagAction() {
        showFilter = true
    }
    
    func bellAction() {
        
    }
    
    func homeAction() {
        selectedTab = .home
    }
    
    func writeAction() {
        selectedTab = .post
    }
    
    func userAction() {
        selectedTab = .profile
    }
    
    func editAction() {
        gotoProfile = true
    }
    
    func signOutAction() {
        
    }
}

#Preview {
    NavigationStack {
        TPDashBoard()
    }
}
