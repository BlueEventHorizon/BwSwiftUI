//
//  BorderButton.swift
//  CombineExample
//
//  Created by Katsuhiko Terada on 2021/06/07.
//

import SwiftUI

public struct BorderedText: View {
    @State var text: String
    @State var selected: Bool = true

    var textColor: Color = .white
    var normalColor: Color = .blue
    var highlightColor: Color = .blue

    var font: Font = .system(size: 12, weight: .bold)
    var cornerRadius: CGFloat = 10
    var lineLimit: Int? = nil

    public var body: some View {
        let bgColor: Color = selected ? self.normalColor : self.highlightColor
        let fgColor: Color = selected ? .white : .white

        Text(text)
            .multilineTextAlignment(.center)
            .lineLimit(lineLimit ?? 1)
            .font(font)
            .padding(10)
            // .lineSpacing(10.0)
            // .frame(height: height)
            .background(bgColor)
            .foregroundColor(fgColor)
            .cornerRadius(cornerRadius)
            // 角丸ボーダーライン
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(selected ? Color(UIColor.darkGray) : Color(UIColor.systemGray3), lineWidth: 1)
            )
    }

    public init(text: String, selected: Bool = false, textColor: Color, normalColor: Color, highlightColor: Color, font: Font, cornerRadius: CGFloat, lineLimit: Int? = nil) {
        _text = State(initialValue: text)
        _selected = State(initialValue: selected)

        self.normalColor = normalColor
        self.highlightColor = highlightColor
        self.font = font
        self.cornerRadius = cornerRadius
        self.lineLimit = lineLimit
    }
}

//public extension BorderedText {
//    func selected(_ selected: Bool) -> Self {
//        _selected = State(initialValue: selected)
//        return self
//    }
//    
//    func textColor(_ color: Color) -> Self {
//        self.textColor = color
//        return self
//    }
//    
//    func normalColor(_ color: Color) -> Self {
//        self.normalColor = color
//        return self
//    }
//    
//    func highlightColor(_ color: Color) -> Self {
//        self.highlightColor = color
//        return self
//    }
//    
//    func font(_ font: Font) -> Self {
//        self.font = font
//        return self
//    }
//    
//    func cornerRadius(_ cornerRadius: CGFloat) -> Self {
//        self.cornerRadius = cornerRadius
//        return self
//    }
//
//    func lineLimit(_ lineLimit: Int) -> Self {
//        self.lineLimit = lineLimit
//        return self
//    }
//}

struct BorderButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BorderedText(text: "これはテストだよ\nこれはテストだよ\nこれはテストだよ\nこれはテストだよ\nこれはテストだよ\nこれはテストだよ", selected: true, textColor: .white, normalColor: .blue, highlightColor: .gray, font: .system(size: 32, weight: .bold), cornerRadius: 10)
            BorderedText(text: "これはテストだよ", selected: false, textColor: .white, normalColor: .blue, highlightColor: .gray, font: .system(size: 32, weight: .bold), cornerRadius: 10)
        }
    }
}
