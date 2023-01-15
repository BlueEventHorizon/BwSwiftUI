//
//  TextStyleModifier.swift
//  InRoomLogMonitor
//
//  Created by Katsuhiko Terada on 2022/11/19.
//

import Foundation
import SwiftUI

public struct TextStyleModifier: ViewModifier {
    var style: TextStyle

    public init(style: TextStyle) {
        self.style = style
    }

    public func body(content: Content) -> some View {
        content
            .font(style.font)
            .foregroundColor(style.textColor)
            .multilineTextAlignment(style.alignment)
            .lineLimit(style.lineLimit)
    }
}

extension View {
    func textStyle(_ style: TextStyle) -> some View {
        modifier(TextStyleModifier(style: style))
    }
}
