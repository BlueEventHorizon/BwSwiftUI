//
//  TextStyle+Preset.swift
//  SiruDoor
//
//  Created by Katsuhiko Terada on 2022/11/19.
//

import Foundation
import SwiftUI
import UIKit

public extension TextStyle {
    enum Preset {
        case `default`
        case multiline

        var textColor: Color {
            .accentColor
        }

        var font: Font {
            .system(size: 14, weight: .bold)
        }

        var style: TextStyle {
            switch self {
                case .multiline:
                    return TextStyle(font: font, textColor: textColor, lineLimit: 10)

                case .default:
                    return TextStyle(font: font, textColor: textColor, lineLimit: 1)
            }
        }
    }
}

public extension Binding<TextStyle> {
    static let `default`: Self = .constant(.Preset.default.style)
    static let multiline: Self = .constant(.Preset.multiline.style)
}
