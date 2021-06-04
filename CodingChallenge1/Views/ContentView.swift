//
//  ContentView.swift
//  CodingChallenge1
//
//  Created by Scott Bennett on 5/29/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var manager = CellManager()
    
    @State private var isAnimating: Bool = false
    
    var bgColor = Color("AppPrimary")
    var fgColor = Color("AppSecondary")
    
    var iterations = 0
    
    var body: some View {
        VStack {
            Text("Cultures")
            
            ScrollView([.horizontal, .vertical]) {
                VStack {
                    ForEach(manager.cells, id: \.self) { array in
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
                        manager.activate()
                        manager.isChanged = true
                    }, label: {
                        Text("Activate")
                    })
                    .frame(width: 100, height: 30)
                    .foregroundColor(.orange)
                    .background(Color(UIColor.systemFill))
                    .cornerRadius(10)
                    
                    Button(action: {
                        for _ in 0... {
                            if !manager.isChanged { break }
                            manager.isChanged = false
                            manager.performTest()
                        }
                        manager.answers()
                        
                    }, label: {
                        Text("Grow")
                    })
                    .disabled(!manager.isChanged)
                    .frame(width: 100, height: 30)
                    .foregroundColor(manager.isChanged ? .orange : .gray)
                    .background(Color(UIColor.systemFill))
                    .cornerRadius(10)
                    .padding()
                    
                    Text("Hours: \(manager.hours)")
                    Text("Live Cultures: \(manager.liveCultures)")
                    Text("Live/Livable Spaces: \(manager.liveRatio, specifier: "%.2f")%")
                }
                
                ActivityIndicator(isAnimating: isAnimating)
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
