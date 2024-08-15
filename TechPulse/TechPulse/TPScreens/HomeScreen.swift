//
//  HomeScreen.swift
//  TechPulse
//
//  Created by RyanM on 8/16/24.
//

import SwiftUI

struct HomeScreen: View {
    var tagAction: () -> Void
    var bellAction: () -> Void
    
    var body: some View {
        VStack {
            Grid {
                GridRow {
                    TPHomeNavigationBar(
                        tagAction: tagAction,
                        bellAction: bellAction
                    )
                }
                
                GridRow {
                    TPSegmented(
                        menu1: "Top Posts", menu2: "Recents"
                    )
                }
            }
            .padding([.leading, .trailing], 20)
            
            Divider()
            
            TPArticleListView()
        }
    }
}
#Preview {
    HomeScreen(tagAction: {}, bellAction: {})
}
