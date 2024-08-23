//
//  TPArticlePost.swift
//  TechPulse
//
//  Created by RyanM on 8/22/24.
//

import SwiftUI

struct TPArticleTabStatsView: View {
    var image: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .resizable()
                .scaledToFit()
                .frame(width: 30, height: 30)
            Text(text)
        }
        .padding()
    }
}

struct TPArticlePostStats: View {
    var clap: () -> Void
    var chat: () -> Void
    var bookmark: () -> Void
    
    var body: some View {
        HStack {
            Button(action: clap) {
                TPArticleTabStatsView(image: "hands.clap", text: "7")
            }
            Spacer()
            Button(action: chat) {
                TPArticleTabStatsView(image: "bubble.left.and.bubble.right", text: "10")
            }
            Spacer()
            Button(action: bookmark) {
                TPArticleTabStatsView(image: "bookmark", text: "")
            }
        }
        .padding([.leading, .trailing], 20)
        .foregroundStyle(Color.white)
        .background(Color(hex: "1F1F1F"))
        //.frame(width: .infinity)
    }
}

struct TPArticlePostHeadlineView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.headline)
            .fontWeight(.bold)
            .foregroundStyle(Color(hex: "3D3D3D"))
    }
}

struct TPArticlePostDescriptionView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.regular)
            .foregroundStyle(Color(hex: "6D6D6D"))
    }
}


struct TPArticlePost: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(TechPulseRouter.self) private var router
    var article: ArticleObject
    
    var body: some View {
        VStack {
            ScrollView {
                Grid(alignment: .leading) {
                    GridRow {
                        TPArticlePostHeadlineView(text: article.title)
                    }
                    
                    GridRow {
                        TPArticlePostDescriptionView(text: article.body)
                    }
                    
                    GridRow {
                        UserProfileFollowComponent(
                            image: "PersonIcon",
                            name: "Erika Albright",
                            status: "8 min read July 5, 2024",
                            followAction: followAction
                        )
                        .padding([.top, .bottom], 20)
                    }
                    
                    GridRow {
                        Image("ImageHeadline")
                    }
                    
                    GridRow {
                        Text("Design for Impact is a down-to-earth A/B testing guide. It features the Conversion Design process to operationalize effective experimentation in your company. In it, Erin Weigel gives you practical tips and tools to design better experiments at scale. She does this with self-deprecating humor that will leave you smiling—if not laughing aloud. As a bonus, The Good Experimental Design toolkit presents everything you learn into step-by-step process for you to use each day. If you’re a curious person working in tech who wants to deliver impactful work, you should read this book. If you’re a business leader looking to help your team make better decisions, you should read this book. If you want to level-up your approach to experimentation, you should read this book. In short, everyone—from CEOs to marketers, engineers, product people, through to designers and content folks—should read this book. Learn a fun, balanced approach to digital product experimentation to get your whole team testing customer-centric ideas. Stop making changes and start making improvements with the Conversion Design process. Follow the Good Experimental Design toolkit so that you and your entire team design for impact together. Clear up confusion around A/B testing with helpful tools and practical advice. Look for loads of actionable tips for effective product experimentation to give your team insight into the big picture. Make the complex math behind why experimentation works easy and understandable.")
                    }
                }
                .padding()
            }
            TPArticlePostStats(
                clap: clapAction,
                chat: chatAction,
                bookmark: bookmarkAction
            )
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) { back }
            ToolbarItem(placement: .topBarTrailing) { menu }
        }
    }
    
    @ViewBuilder
    var back: some View {
        Button(action: backAction) {
            Image(systemName: "chevron.left")
                .foregroundStyle(Color(hex: "3D3D3D"))
        }
    }
    
    @ViewBuilder
    var menu: some View {
        Menu {
            TPMenuItem(
                title: "Edit Profile",
                image: "UserGearIcon",
                action: settingsAction
            )
            
            TPMenuItem(
                title: "Folow Author",
                image: "UserGearIcon",
                action: followAction
            )
            
        } label: {
            Image(systemName: "ellipsis")
                .foregroundStyle(Color(hex: "3D3D3D"))
        }
    }
    
}

extension TPArticlePost {
    
    private func backAction() {
        dismiss()
    }
    
    private func followAction() {
        
    }
    
    private func settingsAction() {
        
    }
    
    private func clapAction() {
        router.push(screen: .claps)
    }

    private func chatAction() {
        
    }

    private func bookmarkAction() {
        
    }

}

#Preview {
    NavigationStack {
        TPArticlePost(article: ArticleFactory.mock0)
    }
}
