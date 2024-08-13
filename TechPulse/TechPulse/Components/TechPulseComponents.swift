//
//  TechPulseComponents.swift
//  TechPulse
//
//  Created by RyanM on 8/7/24.
//

import SwiftUI

enum Regex: String {
    case email = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    case password = "^(?=.*[A-Z])(?=.*[!@#$&*])(?=.*[a-z]).{12,}$"
    case phone = "^\\+(?:[0-9]?){6,14}[0-9]$"
}

extension String {
    func isValid(regexes: [String]) -> Bool {
        for regex in regexes {
            let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
            if predicate.evaluate(with: self) == true {
                return true
            }
        }
        return false
    }
    
    func isValidEmail() -> Bool {
        guard !self.lowercased().hasPrefix("mailto:") else {
            return false
        }
        guard let emailDetector
            = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else {
            return false
        }
        let matches
            = emailDetector.matches(in: self,
                                    options: NSRegularExpression.MatchingOptions.anchored,
                                    range: NSRange(location: 0, length: self.count))
        guard matches.count == 1 else {
            return false
        }
        
        return matches[0].url?.scheme == "mailto"
    }
    
    var firstLetter: String {
        let text = self.trimmingCharacters(in: .whitespacesAndNewlines)
        let letter = text.prefix(1)
        return "\(letter)"
    }
}

extension Color {
    init(hex: String, opacity: Double = 1) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let red = (rgbValue & 0xff0000) >> 16
        let green = (rgbValue & 0xff00) >> 8
        let blue = rgbValue & 0xff

        self.init(red: Double(red) / 0xff, green: Double(green) / 0xff, blue: Double(blue) / 0xff, opacity: opacity)
    }
}

enum HeaderColor {
    case style1
    
    var enable: Color {
        switch self {
        case .style1: return .black
        }
    }
    
    var disable: Color {
        switch self {
        case .style1: return .black
        }
    }
}

enum TextFieldValidation {
    case email
    case nonEmpty
    case password
    case mobile
    
    func isValid(text: String) -> Bool {
        switch self {
        case .email:
            return text.isValidEmail()
        case .nonEmpty:
            return !text.isEmpty
        case .password:
            return text.count > 11
        case .mobile:
            return text.isValid(
                regexes: [Regex.phone].compactMap { "\($0.rawValue)" }
            )
        }
    }
}

struct TextFieldHeader: View {
    
    @Environment(\.colorScheme) private var colorScheme
    
    var title: String
    var capitalize: TextInputAutocapitalization = .never
    var keyboard: UIKeyboardType = .default
    var maxLimit: Int = 60
    var style: HeaderColor = .style1
    var validation: TextFieldValidation = .email
    @Binding var text: String
    
    @State private var titleColor: Color = .red
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(titleColor)
                .fixedSize()
                .padding([.bottom], 8)
            TextField("", text: $text)
                .keyboardType(keyboard)
                .textInputAutocapitalization(capitalize)
                .autocorrectionDisabled(true)
                .frame(height: 20)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(borderStroke, lineWidth: 0.5)
                )
        }
        .onChange(of: text, initial: true) { _, newValue in
            text = String(newValue.prefix(maxLimit))
            process(string: newValue)
        }
    }
}

extension TextFieldHeader {
    
    private func process(string: String) {
        switch validation {
        case .email, .nonEmpty, .password:
            titleColor = validation.isValid(text: string) ? style.enable : style.disable
        case .mobile:
            let isValidPhone = validation.isValid(text: string)
            titleColor = isValidPhone ? style.enable : style.disable
        }
    }
    
    var borderStroke: Color {
        colorScheme == .dark ? .white : .gray
    }
}

enum TextFieldToFocus {
    case textfield
    case securefield
}

struct PasswordField: View {
    
    @Binding var password: String
    @State private var showPassword: Bool = false
    @FocusState private var isFieldFocus: TextFieldToFocus?
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        ZStack(alignment: .trailing) {
            Group {
                if showPassword {
                    TextField("", text: $password)
                        .focused($isFieldFocus, equals: .textfield)
                } else {
                    SecureField("", text: $password)
                        .focused($isFieldFocus, equals: .securefield)
                }
            }
            .textInputAutocapitalization(.never)
            .autocorrectionDisabled(true)
            .frame(height: 20)
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 0.5)
            )
            Spacer()
            Button(
                action: { showPassword.toggle() },
                label: {
                    Image(systemName: showPassword ? "eyeglasses.slash" : "eyeglasses" )
                }
            )
            .tint(iconTintColor)
            .padding([.trailing], 10)
        }
        .onChange(of: showPassword, initial: true) { _, newValue in
            isFieldFocus = showPassword ? .textfield : .securefield
        }
    }
}

extension PasswordField {
    
    var iconTintColor: Color {
        colorScheme == .dark ? .white : .black
    }
}

struct SecureTextField: View {
    var title: String
    var style: HeaderColor = .style1
    var validation: TextFieldValidation = .nonEmpty
    @Binding var text: String
    
    @State private var titleColor: Color = .red
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(.subheadline)
                .fontWeight(.bold)
                .foregroundColor(titleColor)
                .fixedSize()
                .padding([.bottom], 8)
            PasswordField(password: $text)
        }
        .onChange(of: text, initial: true) { _, newValue in
            process(string: newValue)
        }
    }
}

// MARK: - View Event
extension SecureTextField {
    
    private func process(string: String) {
        titleColor = validation.isValid(text: string) ? style.enable : style.disable
    }
}

enum ButtonColor {
    case style1
    case style2
    
    var enable: Color {
        switch self {
        case .style1: return Color(hex: "FF2E3D")
        case .style2: return Color(hex: "FF2E3D")
        }
    }
    
    var disable: Color {
        switch self {
        case .style1: return Color(hex: "FAD0C3")
        case .style2: return Color(hex: "FAD0C3")
        }
    }
}

struct ButtonProminent: View {
    var title: String
    var style: ButtonColor = .style1
    var disable: Bool = false
    var height: CGFloat = 44
    var action: (() -> Void)
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .frame(maxWidth: .infinity)
                .frame(height: height)
        }
        .clipShape(Capsule())
        .buttonStyle(.borderedProminent)
        .disabled(disable)
        .tint(disable ? style.disable : style.enable)
    }
}

struct IconTextStat: View {
    var icon: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(Color(hex:"FF2E3D"))
            Text(text)
                .fontWeight(.light)
        }
    }
}

struct UserName: View {
    var image: String
    var name: String
    
    var body: some View {
        HStack {
            Image(image)
            Text(name)
                .fontWeight(.light)
        }
    }
}

struct StatsView: View {
    var date: String
    var claps: String
    var chats: String
    
    var body: some View {
        HStack {
            Text(date)
                .fontWeight(.light)
            IconTextStat(
                icon: "hands.clap",
                text: claps
            )
            IconTextStat(
                icon: "bubble.left.and.bubble.right",
                text: chats
            )
            Spacer()
            Image(systemName: "bookmark")
                .foregroundStyle(Color(hex:"FF2E3D"))
        }
    }
}

struct ArticleView: View {
    var title: String
    var description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Designing for Impact: 6 Ideas to Enhance the User Experience and Accessibility of Your Power BI")
                .lineLimit(2)
                .font(.headline)
                .fontWeight(.heavy)
            Text("A Journey Through the Design of an Equity, Diversity and Inclusion Power BI Dashboard.")
                .lineLimit(2)
                .font(.subheadline)
                .fontWeight(.light)
        }
    }
}

struct ListItemView: View {
    var body: some View {
        VStack(alignment: .leading) {
            UserName(
                image: "PersonIcon",
                name: "Erika Albright"
            )

            HStack(alignment: .top) {
                ArticleView(
                    title: "Designing for Impact: 6 Ideas to Enhance the User Experience and Accessibility of Your Power BI",
                    description: "A Journey Through the Design of an Equity, Diversity and Inclusion Power BI Dashboard."
                )
                Image("ThumbIcon")
            }
            .padding([.bottom], 10)
            
            StatsView(date: "Mar 6", claps: "40", chats: "5")
        }
    }
}
