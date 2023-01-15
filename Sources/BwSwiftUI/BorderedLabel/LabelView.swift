//
//  LabelView.swift
//  SiruDoor
//
//  Created by Katsuhiko Terada on 2022/09/10.
//

import SwiftUI

@available(iOS 14.0, *)
public struct LabelView: View {
    @Binding public var text: String
    @Binding public var imageName: String

    public var body: some View {
        Label {
            // ""ブランク文字列は、幅を取るので完全排除するには、if文が必須
            if !text.isEmpty {
                Text(text)
            }
        } icon: {
            if !imageName.isEmpty {
                if #available(iOS 16.0, *) {
                    Image(systemName: imageName, variableValue: 1.0)
                } else {
                    Image(systemName: imageName)
                }
            }
        }
    }
}
