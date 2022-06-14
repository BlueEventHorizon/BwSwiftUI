//
//  TextField.swift
//  LoggerApp
//
//  Created by Katsuhiko Terada on 2021/07/13.
//

import SwiftUI

@available(iOS 14.0, *)
public struct TextField: View {
    @Binding var text: String
    @Binding var placeHolder: String

    public var body: some View {
        ZStack(alignment: .topLeading) {
            if text.isEmpty {
                VStack {
                    Text(placeHolder)
                        .foregroundColor(Color(UIColor.placeholderText))
                        .padding(.leading, 5)
                }
                .padding()
            }

            TextEditor(text: $text)
                .frame(height: 44)
                .lineLimit(nil)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.gray, lineWidth: 1)
                )
                .padding(/*@START_MENU_TOKEN@*/ .all/*@END_MENU_TOKEN@*/, 5)
        }
        .onAppear {
            // TextEditorのplaceholder表示のため
            UITextView.appearance().backgroundColor = .clear
        }
    }
}

@available(iOS 14.0, *)
public struct TextField_Previews: PreviewProvider {
    @State static var text: String = ""
    @State static var placeHolder: String = "ここに何か書いてボタンを押す"

    public static var previews: some View {
        TextField(text: $text, placeHolder: $placeHolder)
    }
}
