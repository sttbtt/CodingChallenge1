//
//  StyleGuideCard.swift
//  DesignProject
//
//  Created by Scott Bennett on 5/9/21.
//

import SwiftUI

struct Card: ViewModifier {
    public func body(content: Content) -> some View {
        return content.padding()
            .background(Color("Background2").cornerRadius(10))
            .modifier(EShadow(elevation: .high))
    }
}

struct AccentCard: ViewModifier {
    public func body(content: Content) -> some View {
        return content.padding()
            .background(Color("Background3").cornerRadius(10))
            .modifier(EShadow(elevation: .low))
    }
}

struct StyleGuideCard: View {
    var body: some View {
        HStack {
            Text("Card Modifier")
                .modifier(Card())
            
            Text("AccentCard Modifier")
                .modifier(AccentCard())
        }
    }
}

struct StyleGuideCard_Previews: PreviewProvider {
    static var previews: some View {
        StyleGuideCard()
    }
}
