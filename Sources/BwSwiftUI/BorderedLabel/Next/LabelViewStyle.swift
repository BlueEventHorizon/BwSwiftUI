//
//  LabelViewStyle.swift
//  SiruDoor
//
//  Created by Katsuhiko Terada on 2023/01/16.
//

import SwiftUI

struct LabelViewStyle: LabelStyle {
    let style: TextStyle = .Preset.default.style

    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 32) {
            configuration.icon
            configuration.title
                .multilineTextAlignment(.leading)
                .lineLimit(style.lineLimit)
                .font(style.font)
                .foregroundColor(style.textColor)
        }
    }
}

extension LabelStyle where Self == LabelViewStyle {
    static var labelViewStyle: LabelViewStyle {
        .init()
    }
}
