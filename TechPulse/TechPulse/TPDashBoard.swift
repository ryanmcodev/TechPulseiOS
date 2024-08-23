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
    var selected: (ArticleObject) -> Void
    
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
            
            TPArticleListView(articleType: .user, selected: selected)
        }
    }
}


enum TabMenuType {
    case home
    case post
    case profile
}

struct TPDashBoard: View {
    
    @Environment(TechPulseRouter.self) private var router: TechPulseRouter
    
    @State private var showFilter: Bool = false
    @State private var selectedTab: TabMenuType = .home
    @State private var gotoProfile: Bool = false
    @State private var gotoDetails: Bool = false
    @State private var isTabBarHidden: Bool = false
    
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
                bellAction: bellAction,
                selected: dashBoardSelected
            )

        case .post:
            Text("Post")
//            HomeScreen(
//                tagAction: tagAction,
//                bellAction: bellAction
//            )
            
        case .profile:
            ProfileScreen(
                editAction: editAction,
                signOutAction: signOutAction,
                selected: profileSelected
            )
        }
    }
}

// MARK: - CTAs
extension TPDashBoard {

    func dashBoardSelected(article: ArticleObject) {
        router.push(screen: .detail(article))
    }
    
    func profileSelected(article: ArticleObject) {
        router.push(screen: .detail(article))
    }
    
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
        router.push(screen: .write)
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
