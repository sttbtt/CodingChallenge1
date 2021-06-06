//
//  CustomButtonStyles.swift
//
//  Created by Scott Bennett on 12/16/20.
//

import SwiftUI

struct FilledRoundedCornerButtonStyle: ButtonStyle {
    
    let isDisabled: Bool
    
    var font: Font = .title
    var padding: CGFloat = 10
    var bgColor = Color(.secondarySystemFill)
    var fgColor = Color(.orange)
    var cornerRadius: CGFloat = 8
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(font)
//            .padding(padding)
            .frame(width: 200, height: 40, alignment: .center)
            .background(bgColor)
            .foregroundColor(isDisabled ? .gray : fgColor)
            .cornerRadius(cornerRadius)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
            .animation(.spring())
    }
}
