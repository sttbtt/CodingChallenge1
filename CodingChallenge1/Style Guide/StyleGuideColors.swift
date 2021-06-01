//
//  StyleGuideColors.swift
//  DesignProject
//
//  Created by Scott Bennett on 5/9/21.
//

import SwiftUI

let accentGradient = LinearGradient(gradient: Gradient(colors: [Color("Accent"), Color("Primary")]), startPoint: .topLeading, endPoint: .bottomTrailing)

let primaryGradient = LinearGradient(gradient: Gradient(colors: [Color("Primary"), Color("Secondary")]), startPoint: .topLeading, endPoint: .bottomTrailing)

struct StyleGuideColors: View {
    
    var body: some View {
        VStack(alignment: .trailing) {
            Text("Color Styles")
            
            VStack(alignment: .trailing) {
                ColorView(color: "Accent")
                ColorView(color: "Primary")
                ColorView(color: "Secondary")
                ColorView(color: "Tertary")
            }
            
            VStack(alignment: .trailing) {
                ColorView(color: "Grey1")
                ColorView(color: "Grey2")
                ColorView(color: "Grey3")
                ColorView(color: "Grey4")
            }
            
            VStack {
                Text("My Background is 2")
                    .padding()
                    .background(Color("Background2"))
                
                Text("My Background is 3")
                    .padding()
                    .background(Color("Background3"))
            }
            .padding()
            .background(Color("Background2"))
            
            VStack {
                HStack {
                    Text("Accent Gradient")
                    accentGradient.frame(width: 100, height: 50)
                }
                HStack {
                    Text("Primary Gradient")
                    primaryGradient.frame(width: 100, height: 50)
                }
                
            }
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.top, 50)
        .background(Color("Background1"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct StyleGuideColors_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StyleGuideColors()
            StyleGuideColors()
                .environment(\.colorScheme, .dark)
        }
    }
}

struct ColorView: View {
    
    let color: String
    
    var body: some View {
        HStack(spacing: 20) {
            Text(color)
            
            Text("bla bla")
                .foregroundColor(Color(color))
            
            Color(color)
                .frame(width: 100, height: 30)
        }
    }
}
