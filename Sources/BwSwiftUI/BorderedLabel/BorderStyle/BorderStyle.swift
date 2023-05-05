//
//  BorderStyle.swift
//  SiruDoor
//
//  Created by Katsuhiko Terada on 2023/01/16.
//

import SwiftUI

public struct BorderStyle {
    public let padding: CGSize
    public let fillColor: Color?
    public let cornerRadius: CGFloat
    public let borderLineWidth: CGFloat
    public let borderLineColor: Color
    public let shadowColor: Color
    public let shadowOffset: CGFloat

    public init(padding: CGSize = CGSize(width: 5, height: 3),
                fillColor: Color? = nil,
                cornerRadius: CGFloat = 7,
                borderLineWidth: CGFloat = 0,
                borderLineColor: Color = .clear,
                shadowColor: Color = .clear,
                shadowOffset: CGFloat = 0) {
        self.padding = padding
        self.fillColor = fillColor
        self.cornerRadius = cornerRadius
        self.borderLineWidth = borderLineWidth
        self.borderLineColor = borderLineColor
        self.shadowColor = shadowColor
        self.shadowOffset = shadowOffset
    }

    public func change(padding: CGSize? = nil,
                       fillColor: Color? = nil,
                       cornerRadius: CGFloat? = nil,
                       borderLineWidth: CGFloat? = nil,
                       borderLineColor: Color? = nil,
                       shadowColor: Color? = nil,
                       shadowOffset: CGFloat? = nil) -> BorderStyle {
        BorderStyle(padding: padding ?? self.padding,
                    fillColor: fillColor ?? self.fillColor,
                    cornerRadius: cornerRadius ?? self.cornerRadius,
                    borderLineWidth: borderLineWidth ?? self.borderLineWidth,
                    borderLineColor: borderLineColor ?? self.borderLineColor,
                    shadowColor: shadowColor ?? self.shadowColor,
                    shadowOffset: shadowOffset ?? self.shadowOffset)
    }
}
