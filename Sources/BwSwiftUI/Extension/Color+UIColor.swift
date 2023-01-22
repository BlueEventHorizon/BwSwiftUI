//
//  Color+UIColor.swift
//
//
//  Created by Katsuhiko Terada on 2022/08/14.
//

import SwiftUI

public extension UIColor {
    var color: Color {
        Color(self)
    }
}

public extension Color {
    static let label = UIColor.label.color
    static let secondaryLabel = UIColor.secondaryLabel.color
    static let tertiaryLabel = UIColor.tertiaryLabel.color
    static let quaternaryLabel = UIColor.quaternaryLabel.color
    
    static let systemFill = UIColor.systemFill.color
    static let secondarySystemFill = UIColor.secondarySystemFill.color
    static let tertiarySystemFill = UIColor.tertiarySystemFill.color
    static let quaternarySystemFill = UIColor.quaternarySystemFill.color

    static let placeholderText: Color = UIColor.placeholderText.color

    @available(iOS 15.0, *)
    static let tintColor: Color = UIColor.tintColor.color

    static let systemBackground: Color = UIColor.systemBackground.color
    static let secondarySystemBackground = UIColor.secondarySystemBackground.color
    static let tertiarySystemBackground = UIColor.tertiarySystemBackground.color

    static let systemGroupedBackground = UIColor.systemGroupedBackground.color
    static let secondarySystemGroupedBackground = UIColor.secondarySystemGroupedBackground.color
    static let tertiarySystemGroupedBackground = UIColor.tertiarySystemGroupedBackground.color

    static let separator = UIColor.separator.color
    static let opaqueSeparator = UIColor.opaqueSeparator.color

    static let link = UIColor.link.color

    static let darkText = UIColor.darkText.color
    static let lightText = UIColor.lightText.color
}
