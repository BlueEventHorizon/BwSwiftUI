//
//  BorderStyle+PreDefined.swift
//  SiruDoor
//
//  Created by Katsuhiko Terada on 2023/01/16.
//

import Foundation
import SwiftUI
import UIKit

public extension BorderStyle {
    static var `default`: PreDefined = .default
    static var bordered: PreDefined = .bordered
    static var shadowed: PreDefined = .shadowed
    static var smallShadowed: PreDefined = .smallShadowed

    enum PreDefined {
        case `default`
        case bordered
        case shadowed
        case smallShadowed

        private var fillColor: Color {
            Color(UIColor.secondarySystemBackground)
        }

        public var style: BorderStyle {
            switch self {
                case .default:
                    return BorderStyle(
                        padding: .init(width: 35, height: 15),
                        fillColor: fillColor,
                        cornerRadius: 10,
                        borderLineWidth: 1,
                        borderLineColor: Color(UIColor.systemGray3),
                        shadowColor: .clear,
                        shadowOffset: 3
                    )

                case .bordered:
                    return BorderStyle(
                        padding: .init(width: 35, height: 15),
                        fillColor: fillColor,
                        cornerRadius: 10,
                        borderLineWidth: 1,
                        borderLineColor: Color(UIColor.systemGray3),
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
                        shadowColor: Color(UIColor.secondaryLabel),
                        shadowOffset: 3
                    )

                case .smallShadowed:
                    return BorderStyle(
                        padding: .init(width: 5, height: 5),
                        fillColor: fillColor,
                        cornerRadius: 4,
                        borderLineWidth: 0,
                        borderLineColor: .clear,
                        shadowColor: Color(UIColor.secondaryLabel),
                        shadowOffset: 2
                    )
            }
        }
    }
}

public extension Binding<BorderStyle> {
    static let `default`: Self = .constant(.PreDefined.default.style)
    static let bordered: Self = .constant(.PreDefined.bordered.style)
    static let shadowed: Self = .constant(.PreDefined.shadowed.style)
    static let smallShadowed: Self = .constant(.PreDefined.smallShadowed.style)
}
