//
//  TPDashBoard.swift
//  TechPulse
//
//  Created by RyanM on 8/7/24.
//

import SwiftUI

struct TPDashBoard: View {
    @State private var showFilter: Bool = false
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                Grid {
                    GridRow {
                        HStack {
                            Text("Home")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                            Spacer()
                            Button(action: tagAction) {
                                Image("TagIcon")
                            }
                            Button(action: bellAction) {
                                Image("BellIcon")
                            }
                            
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
                    

                }
                .padding([.leading, .trailing], 20)
                
                Divider()
                
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
            
            TPTabControl(
                homeAction: homeAction,
                writeAction: writeAction,
                profileAction: userAction
            )
        }
        .toolbar(.hidden, for: .navigationBar)
        .sheet(isPresented: $showFilter) {
            TPFilterView()
                .presentationDetents([.height(200)])
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
        
    }
    
    func writeAction() {
        
    }
    
    func userAction() {
        
    }
}

#Preview {
    NavigationStack {
        TPDashBoard()
    }
}
