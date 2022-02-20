//
//  BorderButton.swift
//  CombineExample
//
//  Created by Katsuhiko Terada on 2021/06/07.
//

import SwiftUI

public struct ButtonScheme {
    public let textColor: Color
    public let fillColor: Color
    public let font: Font
    public let cornerRadius: CGFloat

    public static var `default` = ButtonScheme(textColor: .white, fillColor: .blue, font: .system(size: 14, weight: .bold), cornerRadius: 10)

    public init(textColor: Color, fillColor: Color, font: Font, cornerRadius: CGFloat) {
        self.textColor = textColor
        self.fillColor = fillColor
        self.font = font
        self.cornerRadius = cornerRadius
    }
}

public struct BorderedText: View {
    public let text: String
    public let scheme: ButtonScheme
    // @Binding var selected: Bool

    public var lineLimit: Int = 1

    public var body: some View {
        let fillColor: Color = scheme.fillColor
        let textColor: Color = scheme.textColor

        Text(text)
            .multilineTextAlignment(.center)
            .lineLimit(lineLimit)
            .font(scheme.font)
            .padding(10)
            // .lineSpacing(10.0)
            // .frame(height: height)
            .background(fillColor)
            .foregroundColor(textColor)
            .cornerRadius(scheme.cornerRadius)
            // 角丸ボーダーライン
            .overlay(
                RoundedRectangle(cornerRadius: scheme.cornerRadius)
                    .stroke(Color(UIColor.systemGray3), lineWidth: 1)
            )
    }

    public init(text: String, scheme: ButtonScheme) {
        self.text = text
        self.scheme = scheme
    }
}

@ViewBuilder public func makeBorderedButton(text: String, scheme: ButtonScheme, action: ((String) -> Void)?) -> some View {
    Button {
        action?(text)
    } label: {
        BorderedText(text: text, scheme: scheme)
    }
}

struct BorderedText_Previews: PreviewProvider {
    static var text: String = "これはテストだよ\nこれはテストだよ\nこれはテストだよ\nこれはテストだよ\nこれはテストだよ\nこれはテストだよ"
    static var scheme: ButtonScheme = .default
//    @State static var selected: Bool = true
//    @State static var notSelected: Bool = false

    static var previews: some View {
        Group {
            makeBorderedButton(text: text, scheme: scheme) { _ in print("pushed") }
            makeBorderedButton(text: text, scheme: scheme) { _ in print("pushed") }
        }
    }
}
