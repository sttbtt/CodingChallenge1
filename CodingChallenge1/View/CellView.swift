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
                    ForEach(cellManager.cells, id: \.self) { array in
                        HStack {
                            ForEach(array, id: \.self) { element in
                                Text(element.rawValue)
                                    .font(.system(.body, design: .monospaced))
                            }
                        }
                    }
                }
            }
            .padding()
            
            HStack {
                VStack {
                    Button(action: {
                        cellManager.activate()
                        cellManager.isChanged = true
                    }, label: {
                        Text("Activate")
                    })
                    .frame(width: 100, height: 30)
                    .foregroundColor(.orange)
                    .background(Color(UIColor.systemFill))
                    .cornerRadius(10)
                    
                    Button(action: {
                        cellManager.growCells()
                    }, label: {
                        Text("Grow")
                    })
                    .disabled(!cellManager.isChanged)
                    .frame(width: 100, height: 30)
                    .foregroundColor(cellManager.isChanged ? .orange : .gray)
                    .background(Color(UIColor.systemFill))
                    .cornerRadius(10)
                    .padding()
                    
                    Text("Hours: \(cellManager.hours)")
                    Text("Live Cultures: \(cellManager.liveCultures)")
                    Text("Live/Livable Spaces: \(cellManager.liveRatio, specifier: "%.2f")%")
                }
                
                ActivityIndicator(isAnimating: cellManager.isAnimating)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(cellManager: CellManager())
    }
}
