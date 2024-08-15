//
//  TPFilterView.swift
//  TechPulse
//
//  Created by RyanM on 8/13/24.
//

import SwiftUI

struct TPChips: View {
    var title: String
    @State private var isSelected: Bool = false
    
    var body: some View {
        Button(action: buttonTap) {
            textComponent
        }
    }
    
    private var textComponent: some View {
        Text(title)
            .lineLimit(1)
            .fixedSize()
            .foregroundStyle(textColor)
            .padding(10)
            .background {
                Capsule(style: .circular)
                    .foregroundStyle(capsuleColor)
            }
    }
    
    private var textColor: Color {
        isSelected ? .white : .black
    }
    
    private var capsuleColor: Color {
        isSelected ? .black : Color(hex: "F6F6F6")
    }
    
    private func buttonTap() {
        isSelected.toggle()
    }
}

struct TPFilterView: View {
    @Environment(\.dismiss) var dismiss
    let chips: [String] = ["Events", "Games", "Sports", "Technology"]
    private let columns = [GridItem(.adaptive(minimum: 90, maximum: 80))]
    var body: some View {
        VStack {
            Capsule(style: .continuous)
                .foregroundStyle(.black)
                .frame(width: 100, height: 10)
                .padding([.top], 20)
            HStack {
                headerText
                Spacer()
                cancelButton
            }
            .padding([.leading, .trailing, .bottom], 20)
            VStack(alignment: .leading) {
                HStack {
                    Text("Recommended")
                    Text("Topics")
                        .foregroundStyle(Color(hex: "FF2E3D"))
                }
                .font(.body)
                .fontWeight(.semibold)
                ScrollView {
                    LazyVGrid(columns: columns, alignment: .leading) {
                        ForEach(chips, id: \.self) { chip in
                            TPChips(title: chip)
                        }
                    }
                }
                .scrollIndicators(.hidden)
            }
            .padding([.leading, .trailing], 20)
        }
    }
    
    var headerText: some View {
        Text("Pick filter by")
            .fontWeight(.medium)
    }
    
    var cancelButton: some View {
        Button(action: cancelAction) {
            Text("CANCEL")
                .fontWeight(.bold)
        }
        .tint(Color(hex: "FF2E3D"))
    }
    
    private func cancelAction() {
        dismiss()
    }
}

#Preview {
    TPFilterView()
}
