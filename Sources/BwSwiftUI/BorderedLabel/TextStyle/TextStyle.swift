//
//  TextStyle.swift
//  SiruDoor
//
//  Created by Katsuhiko Terada on 2023/01/16.
//

import SwiftUI

public struct TextStyle {
    public let font: Font
    public let textColor: Color
    public let alignment: TextAlignment
    public let lineLimit: Int

    public init(font: Font,
                textColor: Color = .accentColor,
                alignment: TextAlignment = .center,
                lineLimit: Int = 0) {
        self.font = font
        self.textColor = textColor
        self.alignment = alignment
        self.lineLimit = lineLimit
    }

    public func change(font: Font? = nil,
                       textColor: Color? = nil,
                       alignment: TextAlignment? = nil,
                       lineLimit: Int? = nil) -> TextStyle {
        TextStyle(font: font ?? self.font,
                  textColor: textColor ?? self.textColor,
                  alignment: alignment ?? self.alignment,
                  lineLimit: lineLimit ?? self.lineLimit)
    }
}
