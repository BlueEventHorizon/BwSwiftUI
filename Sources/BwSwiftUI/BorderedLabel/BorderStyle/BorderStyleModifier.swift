//
//  BorderStyleModifier.swift
//  InRoomLogMonitor
//
//  Created by Katsuhiko Terada on 2022/11/19.
//

import Foundation
import SwiftUI

public struct BorderStyleModifier: ViewModifier {
    var style: BorderStyle

    public init(style: BorderStyle) {
        self.style = style
    }

    public func body(content: Content) -> some View {
        content
            .padding(.horizontal, style.padding.width)
            .padding(.vertical, style.padding.height)

        #if canImport(UIKit)
            .background(style.fillColor)
            .cornerRadius(style.cornerRadius)
            // 角丸ボーダーライン
            .overlay(
                RoundedRectangle(cornerRadius: style.cornerRadius)
                    .stroke(style.borderLineColor, lineWidth: style.borderLineWidth)
            )
        #else
            // Macでは角丸ボーダーラインがうまく表示できない🤔
        #endif

            // Viewの要素をグループ化
            .compositingGroup()
            .shadow(color: style.shadowColor,
                    radius: style.shadowOffset,
                    x: style.shadowOffset,
                    y: style.shadowOffset)
    }
}

extension View {
    func borderStyle(_ style: BorderStyle) -> some View {
        modifier(BorderStyleModifier(style: style))
    }
}
