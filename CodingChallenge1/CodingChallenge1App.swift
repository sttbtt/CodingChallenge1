//
//  CodingChallenge1App.swift
//  CodingChallenge1
//
//  Created by Scott Bennett on 5/29/21.
//

import SwiftUI

@main
struct CodingChallenge1App: App {
    
    @StateObject var cellManager = CellManager()
    
    var body: some Scene {
        WindowGroup {
            CellView(cellManager: cellManager)
        }
    }
}
