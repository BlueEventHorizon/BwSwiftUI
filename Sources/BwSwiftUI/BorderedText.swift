//
//  BorderButton.swift
//  CombineExample
//
//  Created by Katsuhiko Terada on 2021/06/07.
//

import SwiftUI

public struct ButtonScheme {
    public let textColor: Color
    public let normalColor: Color
    public let highlightColor: Color
    public let font: Font
    public let cornerRadius: CGFloat
    
    static public var `default` = ButtonScheme(textColor: .black, normalColor: .gray, highlightColor: .black, font: .system(size: 12, weight: .bold), cornerRadius: 10)
}

public struct BorderedText: View {
    public let text: String
    public let scheme: ButtonScheme
    @Binding var selected: Bool

    public var lineLimit: Int = 1

    public var body: some View {
        let bgColor: Color = selected ? scheme.normalColor : scheme.highlightColor
        let fgColor: Color = selected ? .white : .white

        Text(text)
            .multilineTextAlignment(.center)
            .lineLimit(lineLimit)
            .font(scheme.font)
            .padding(10)
            // .lineSpacing(10.0)
            // .frame(height: height)
            .background(bgColor)
            .foregroundColor(fgColor)
            .cornerRadius(scheme.cornerRadius)
            // 角丸ボーダーライン
            .overlay(
                RoundedRectangle(cornerRadius: scheme.cornerRadius)
                    .stroke(selected ? Color(UIColor.darkGray) : Color(UIColor.systemGray3), lineWidth: 1)
            )
    }
    
    public init(text: String, scheme: ButtonScheme, selected: Binding<Bool>) {
        self.text = text
        self.scheme = scheme
        _selected = selected
    }
}

struct BorderedText_Previews: PreviewProvider {
    static var text: String = "これはテストだよ\nこれはテストだよ\nこれはテストだよ\nこれはテストだよ\nこれはテストだよ\nこれはテストだよ"
    static var scheme: ButtonScheme = .default
    @State static var selected: Bool = true
    @State static var notSelected: Bool = false

    static var previews: some View {
        Group {
            BorderedText(text: text, scheme: scheme, selected: $selected)
            BorderedText(text: text, scheme: scheme, selected: $notSelected)
        }
    }
}
