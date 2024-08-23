//
//  TPArticalPostClaps.swift
//  TechPulse
//
//  Created by RyanM on 8/23/24.
//

import SwiftUI
import Observation

struct TPFollowButton: View {
    var title: String
    var style: HeaderColor = .style1
    
    @State private var disable: Bool = false
    var body: some View {
        Button(action: buttonAction) {
            Text(title)
                .font(.title3)
                .fontWeight(.regular)
                .frame(maxWidth: .infinity)
                .frame(width: 60,height: 20)
        }
        .clipShape(Capsule())
        .buttonStyle(.borderedProminent)
        .disabled(disable)
        .tint(Color(hex: "FF2E3D"))
    }
    
    private func buttonAction() {
        disable.toggle()
    }
}

struct TPArticalPostClapItemCell: View {
    var info: FollowInfo
    var body: some View {
        HStack {
            UserProfileComponent(
                image: "PersonIcon",
                name: "Erika Albright",
                status: "Music lover"
            )
            Spacer()
            TPFollowButton(title: "Follow")
        }
    }
}

struct FollowInfo: Identifiable, Hashable {
    let id = UUID()
    let clap: String
    
    static var mock: [FollowInfo] {
        [
            FollowInfo(clap: "1"),
            FollowInfo(clap: "2"),
            FollowInfo(clap: "3"),
            FollowInfo(clap: "4"),
            FollowInfo(clap: "5"),
            FollowInfo(clap: "6"),
            FollowInfo(clap: "7")
        ]
    }
}

@Observable
final class TPArticalPostClapViewModel {
    var claps: [FollowInfo] = FollowInfo.mock
}

struct TPArticalPostClaps: View {
    
    @Environment(\.dismiss) private var dismiss
    @State private var model = TPArticalPostClapViewModel()
    
    var body: some View {
        List(model.claps, id: \.id) { item in
            TPArticalPostClapItemCell(info: item)
                .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) { back }
        }
    }
    
    @ViewBuilder
    private var back: some View {
        Button(action: backAction) {
            HStack {
                Image(systemName: "chevron.left")
                Text("\(model.claps.count) claps from readers")
            }
        }
        .tint(Color.black)
    }
    
    private func backAction() {
        dismiss()
    }
}

#Preview {
    NavigationStack {
        TPArticalPostClaps()
    }
}
