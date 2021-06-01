//
//  StyleGuideButton.swift
//  DesignProject
//
//  Created by Scott Bennett on 5/11/21.
//

import SwiftUI

struct StyleGuideButton: View {
    var body: some View {
        VStack(spacing: 20) {
            Button(action: {
                
            }) {
                Text("SimpleButtonStyle")
            }
            .buttonStyle(SimpleButtonStyle(isDisabled: false))
            
            Button(action: {
                print("Blue button pressed")
            }) {
                Text("Advanced Button Style")
            }
            .buttonStyle(AdvancedButtonStyle())
            
            Button(action: {
                print("Green button pressed")
            }) {
                Text("Advanced Button Style")
            }
            .buttonStyle(AdvancedButtonStyle(color: Color("Primary")))
            
            Button(action: {
                print("Enabled button pressed")
            }) {
                Text("Advanced Button Style - Disabled")
            }
            .buttonStyle(AdvancedButtonStyle(color: Color("Primary"), isEnabled: false))
        }
    }
}

struct StyleGuideButton_Previews: PreviewProvider {
    static var previews: some View {
        StyleGuideButton()
    }
}

struct SimpleButtonStyle: ButtonStyle {
    
    let isDisabled: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        
        return configuration.label
            .modifier(BodyText())
            .foregroundColor(.white)
            .padding()
            .background(accentGradient.cornerRadius(5).modifier(EShadow(elevation: configuration.isPressed ? .low : .high)))
            .saturation(isDisabled ? 0 : 1)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

struct AdvancedButtonStyle: PrimitiveButtonStyle {
    
    let color: Color
    let isEnabled: Bool
    
    init(color: Color = Color("Accent"), isEnabled: Bool = true) {
        self.color = color
        self.isEnabled = isEnabled
    }
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(color)
            .saturation(isEnabled ? 0 : 1)
            .padding()
            .modifier(Header3())
            .background(Color("Background3").cornerRadius(5))
            .modifier(EShadow(elevation: .middle))
            .onTapGesture {
                print("Tapped")
                if isEnabled {
                    configuration.trigger()
                }
            }
    }
}
