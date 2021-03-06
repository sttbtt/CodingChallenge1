//
//  StyleGuideShadows.swift
//
//  Created by Scott Bennett on 5/9/21.
//

import SwiftUI

struct CShadow: ViewModifier {
    func body(content: Content) -> some View {
        return content.shadow(color: .black.opacity(0.2), radius: 20, x: 10, y: 10)
    }
}

extension View {
    public func cShadow() -> some View {
        modifier(CShadow())
    }
    
    public func eShadow() -> some View {
        modifier(EShadow(elevation: .middle))
    }
}

enum Elevation {
    case low
    case middle
    case high
}

struct EShadow: ViewModifier {
    
    let elevation: Elevation

    func body(content: Content) -> some View {
        
        switch elevation {
        case .low:
            return content.shadow(color: .black.opacity(0.05), radius: 5, x: 5, y: 5)
        case .middle:
            return content.shadow(color: .black.opacity(0.15), radius: 10, x: 7, y: 7)
        case .high:
            return content.shadow(color: .black.opacity(0.2), radius: 20, x: 10, y: 10)
        }
    }
}
