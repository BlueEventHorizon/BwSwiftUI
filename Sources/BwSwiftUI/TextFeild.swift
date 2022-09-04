//
//  TextField.swift
//  LoggerApp
//
//  Created by Katsuhiko Terada on 2021/07/13.
//

import SwiftUI

@available(iOS 14.0, *)
public struct TextField: View {
    @Binding public var text: String
    @Binding public var placeHolder: String

    public var body: some View {
        ZStack(alignment: .topLeading) {
            TextEditor(text: $text)
                .lineLimit(nil)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/, 5)

            if text.isEmpty {
                VStack {
                    Text(placeHolder)
                        .foregroundColor(UIColor.placeholderText.color)
                        .padding(.leading, 5)
                }
                .padding()
            }
        }
        // Viewの要素をグループ化
        .compositingGroup()
        .onAppear {
            // TextEditorのplaceholder表示のため
            UITextView.appearance().backgroundColor = .clear
        }
    }

    public init(text: Binding<String>, placeHolder: Binding<String>) {
        _text = text
        _placeHolder = placeHolder
    }
}

@available(iOS 14.0, *)
public struct TextField_Previews: PreviewProvider {
    public static var previews: some View {
        Group {
            TextField(text: .constant("何か"), placeHolder: .constant("ここに何か書いてボタンを押す"))
                .previewLayout(.fixed(width: 375, height: 100))
            TextField(text: .constant(""), placeHolder: .constant("ここに何か書いてボタンを押す"))
                .previewLayout(.fixed(width: 375, height: 100))
        }
        .previewLayout(.sizeThatFits)
        // .previewLayout(.fixed(width: 375, height: 100))
    }
}
