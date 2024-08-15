//
//  TPArticleListView.swift
//  TechPulse
//
//  Created by RyanM on 8/16/24.
//

import SwiftUI

struct ArticleObject: Identifiable {
    let id = UUID()
    let title: String
    let body: String
}

struct TPArticleListView: View {
    
    var body: some View {
        List() {
            ListItemView()
            ListItemView()
            ListItemView()
            ListItemView()
            ListItemView()
            ListItemView()
        }
        .scrollIndicators(.hidden)
        .listStyle(.plain)
    }
}

#Preview {
    TPArticleListView()
}
