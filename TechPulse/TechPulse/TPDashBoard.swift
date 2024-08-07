//
//  TPDashBoard.swift
//  TechPulse
//
//  Created by RyanM on 8/7/24.
//

import SwiftUI



struct TPDashBoard: View {
    var body: some View {
        VStack {
            Grid {
                GridRow {
                    HStack {
                        Text("Home")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Spacer()
                        Image("TagIcon")
                        Image("BellIcon")
                    }
                }
                
                GridRow {
                    HStack {
                        Text("Top Posts")
                            .padding([.leading,.trailing], 20)
                        Text("Recents")
                        Spacer()
                    }
                }
                
                Divider()
            }
            
            List() {
                ListItemView()
                ListItemView()
                ListItemView()
                ListItemView()
                ListItemView()
            }
            .scrollIndicators(.hidden)
            .listStyle(.plain)
            
        }
        .padding()
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        TPDashBoard()
    }
}
