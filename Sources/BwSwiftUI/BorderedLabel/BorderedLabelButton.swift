//
//  BorderedLabelButton.swift
//  SiruDoor
//
//  Created by Katsuhiko Terada on 2021/06/07.
//

import SwiftUI

public struct BorderedLabelButton: View {
    @Binding public var text: String
    @Binding public var imageName: String
    @Binding public var textStyle: TextStyle
    @Binding public var borderStyle: BorderStyle

    @Binding public var toggleValue: Bool
    @Binding public var enable: Bool

    let action: ((Bool) -> Void)?

    public var body: some View {
        Button {
            toggleValue.toggle()
            action?(toggleValue)
        } label: {
            BorderedLabelView(text: $text, imageName: $imageName, textStyle: $textStyle, borderStyle: $borderStyle)
        }
        .disabled(!enable)
    }
    
    public init(text: Binding<String>, imageName: Binding<String>, textStyle: Binding<TextStyle>, borderStyle: Binding<BorderStyle>, toggleValue: Binding<Bool>, enable: Binding<Bool>, action: ( (Bool) -> Void)?) {
        self._text = text
        self._imageName = imageName
        self._textStyle = textStyle
        self._borderStyle = borderStyle
        self._toggleValue = toggleValue
        self._enable = enable
        self.action = action
    }
}

struct BorderedLabelButton_Previews: PreviewProvider {
    static let text: String = "あいうえおかきくけこさしすせそ\nたちつてと\nなにぬねの\nこれはテストだよ\nこれはテストだよ"
    static let text2: String = "あいうえお"
    static let imageName = Binding<String>.constant("square.and.arrow.up.on.square")

    static var previews: some View {
        Group {
            Button {
                print(text)
            } label: {
                BorderedLabelView(text: .constant(text), imageName: imageName, textStyle: .default, borderStyle: .bordered)
            }
            .previewDisplayName("Button + BorderedLabelView")

            BorderedLabelButton(text: .constant(text2), imageName: imageName, textStyle: .default, borderStyle: .shadowed, toggleValue: .constant(false), enable: .constant(true)) { toggleValue in
                print(toggleValue)
            }
            .previewDisplayName("BorderedLabelButton + shadowed")

            BorderedLabelButton(text: .constant(""), imageName: imageName, textStyle: .default, borderStyle: .smallShadowed, toggleValue: .constant(false), enable: .constant(true)) { toggleValue in
                print(toggleValue)
            }
            .previewDisplayName("BorderedLabelButton + smallShadowed")
        }
        .previewLayout(.fixed(width: 375, height: 100))
    }
}
