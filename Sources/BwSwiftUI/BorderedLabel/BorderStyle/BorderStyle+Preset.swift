//
//  BorderStyle+Preset.swift
//  SiruDoor
//
//  Created by Katsuhiko Terada on 2023/01/16.
//

import Foundation
import SwiftUI
import UIKit

public extension BorderStyle {
    static var `default`: Preset = .default
    static var bordered: Preset = .bordered
    static var shadowed: Preset = .shadowed
    static var smallShadowed: Preset = .smallShadowed

    enum Preset {
        case `default`
        case bordered
        case shadowed
        case smallShadowed

        private var fillColor: Color {
            Color.secondarySystemBackground
        }

        public var style: BorderStyle {
            switch self {
                case .default:
                    return BorderStyle(
                        padding: .init(width: 35, height: 15),
                        fillColor: fillColor,
                        cornerRadius: 10,
                        borderLineWidth: 1,
                        borderLineColor: .secondaryLabel,
                        shadowColor: .clear,
                        shadowOffset: 3
                    )

                case .bordered:
                    return BorderStyle(
                        padding: .init(width: 35, height: 15),
                        fillColor: fillColor,
                        cornerRadius: 10,
                        borderLineWidth: 1,
                        borderLineColor: .secondaryLabel,
                        shadowColor: .clear,
                        shadowOffset: 3
                    )

                case .shadowed:
                    return BorderStyle(
                        padding: .init(width: 35, height: 15),
                        fillColor: fillColor,
                        cornerRadius: 10,
                        borderLineWidth: 0,
                        borderLineColor: .clear,
                        shadowColor: .secondaryLabel,
                        shadowOffset: 3
                    )

                case .smallShadowed:
                    return BorderStyle(
                        padding: .init(width: 5, height: 5),
                        fillColor: fillColor,
                        cornerRadius: 4,
                        borderLineWidth: 0,
                        borderLineColor: .clear,
                        shadowColor: .secondaryLabel,
                        shadowOffset: 2
                    )
            }
        }
    }
}

public extension Binding<BorderStyle> {
    static let `default`: Self = .constant(.Preset.default.style)
    static let bordered: Self = .constant(.Preset.bordered.style)
    static let shadowed: Self = .constant(.Preset.shadowed.style)
    static let smallShadowed: Self = .constant(.Preset.smallShadowed.style)
}
