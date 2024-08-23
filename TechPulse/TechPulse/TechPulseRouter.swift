//
//  TechPulseRouter.swift
//  TechPulse
//
//  Created by RyanM on 8/23/24.
//

import SwiftUI
import Observation

enum TechPulseScreen: Hashable {
    case login
    case dashboard
    case signup
    case write
    case detail(ArticleObject)
    case claps
}

extension TechPulseScreen {
    @ViewBuilder
    var view: some View {
        switch self {
        case .login:
            TechPulseMain()
        case .dashboard:
            TPDashBoard()
        case .signup:
            TPCreateAccount()
        case .write:
            Text("Write a Post")
        case .detail(let article):
            TPArticlePost(article: article)
        case .claps:
            TPArticalPostClaps()
        }
    }
}

@Observable
final class TechPulseRouter {
    var path: NavigationPath
    init() {
        self.path = NavigationPath()
    }
    
    func push(screen: TechPulseScreen) {
        path.append(screen)
    }
    
    func pop() {
        path.removeLast()
    }
}
