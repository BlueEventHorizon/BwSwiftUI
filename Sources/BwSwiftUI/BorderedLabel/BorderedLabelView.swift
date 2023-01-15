//
//  BorderedLabelView.swift
//  SiruDoor
//
//  Created by Katsuhiko Terada on 2022/11/19.
//

import Foundation
import SwiftUI

public struct BorderedLabelView: View {
    @Binding public var text: String
    @Binding public var imageName: String
    @Binding public var textStyle: TextStyle
    @Binding public var borderStyle: BorderStyle

    public var body: some View {
        LabelView(text: $text, imageName: $imageName)
            .textStyle(textStyle)
            .borderStyle(borderStyle)
    }
}

struct BorderedLabelView_Previews: PreviewProvider {
    static let text: String = "あいうえおかきくけこさしすせそ\nたちつてと\nなにぬねの\nこれはテストだよ\nこれはテストだよ"
    static let text2: String = "あいうえお"
    static let imageName: String = "square.and.arrow.up.on.square"

    static var previews: some View {
        Group {
            BorderedLabelView(text: .constant(text),
                              imageName: .constant(imageName),
                              textStyle: .multiline,
                              borderStyle: .bordered)
                .previewDisplayName("multiline + bordered")

            BorderedLabelView(text: .constant(text2),
                              imageName: .constant(imageName),
                              textStyle: .default,
                              borderStyle: .shadowed)
                .previewDisplayName("default + shadowed")

            BorderedLabelView(text: .constant(""),
                              imageName: .constant(imageName),
                              textStyle: .default,
                              borderStyle: .smallShadowed)
                .previewDisplayName("default + smallShadowed")
        }
        .previewLayout(.fixed(width: 375, height: 100))
    }
}
