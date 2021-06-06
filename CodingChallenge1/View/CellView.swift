//
//  ContentView.swift
//  CodingChallenge1
//
//  Created by Scott Bennett on 5/29/21.
//

import SwiftUI

struct CellView: View {
    
    @ObservedObject var cellManager: CellManager
    
    var body: some View {
        VStack {
            Text("Cultures")
            
            ScrollView([.horizontal, .vertical]) {
                VStack {
                    Text(cellManager.cellText)
                        .font(.system(.body, design: .monospaced))
                    
//                    ForEach(cellManager.cells, id: \.self) { array in
//                        HStack {
//                            ForEach(array, id: \.self) { element in
//                                Text(element.rawValue)
//                                    .font(.system(.body, design: .monospaced))
//                            }
//                        }
//                    }
                }
            }
            .padding()

            VStack(spacing: 20) {
                Button(action: {
                    cellManager.activate()
                    cellManager.isChanged = true
                }, label: {
                    Text("Activate")
                })
                .buttonStyle(FilledRoundedCornerButtonStyle(isDisabled: false))
                .eShadow()
                
                Button(action: {
                    cellManager.growCells()
                }, label: {
                    Text("Grow")
                })
                .disabled(!cellManager.isChanged)
                .buttonStyle(FilledRoundedCornerButtonStyle(isDisabled: !cellManager.isChanged))
                .eShadow()
                
                VStack {
                    Text("Hours: \(cellManager.hours)")
                    Text("Live Cultures: \(cellManager.liveCultures)")
                    Text("Live/Livable Spaces: \(cellManager.liveRatio, specifier: "%.2f")%")
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(cellManager: CellManager())
    }
}
