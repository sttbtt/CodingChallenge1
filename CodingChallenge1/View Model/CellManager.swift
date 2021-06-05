//
//  CellManager.swift
//  CodingChallenge1
//
//  Created by Scott Bennett on 6/3/21.
//

import Foundation
import Combine

class CellManager: ObservableObject {
    
    @Published var cells: [[Cell]] = [[]]
    @Published var liveCultures: Int = 0
    @Published var liveRatio: Double = 0
    @Published var hours: Int = 0
    @Published var isChanged: Bool = false
    @Published var isAnimating: Bool = false
    
    var tempArray: [[Cell]] = [[]]
    var switchTest: Bool = true
    var largeTest: Bool = true
    
    init() {
        cells = largeTest ? CellData.init().largeArray : CellData.init().smallArray
        tempArray = cells
    }
    
    
    func activate() {
        hours = 1
        liveRatio = 0
        liveCultures = 0
        isChanged = true
        
        for i in 0..<tempArray.count {
            for j in 0..<tempArray[0].count {
                if tempArray[i][j] == Cell.L {
                    tempArray[i][j] = Cell.A
                }
            }
        }
        cells = tempArray
    }
    
    
    func growCells() {
        for _ in 0... {
            if !isChanged { break }
            isChanged = false
            performTest()
        }
        answers()
    }
    
    
    func performTest() {
        if switchTest {
            crowdingTest()
        } else {
            adjacentTest()
        }
        switchTest.toggle()
        
        if isChanged {
            hours += 1
        }
    }
    
    
    func crowdingTest() {
        
        for i in 0..<cells.count {
            for j in 0..<cells[0].count {
                if cells[i][j] == Cell.D { continue }
                
                if checkCount(i: i, j: j) >= 4 && tempArray[i][j] != Cell.L {
                    tempArray[i][j] = Cell.L
                    isChanged = true
                }
            }
        }
        
        cells = tempArray
    }
    
    
    func adjacentTest() {
        
        for i in 0..<cells.count {
            for j in 0..<cells[0].count {
                if cells[i][j] == Cell.D { continue }
                
                if checkCount(i: i, j: j) == 0 && tempArray[i][j] != Cell.A {
                    tempArray[i][j] = Cell.A
                    isChanged = true
                }
            }
        }
        
        cells = tempArray
    }
    
    
    func checkCount(i: Int, j: Int) -> Int {
        
        var testArray: [Cell] = []
        
        testArray.append(i == 0 || j == 0 ? Cell.D : cells[i - 1][j - 1])
        testArray.append(j == 0 ? Cell.D : cells[i][j - 1])
        testArray.append(i == (cells.count - 1) || j == 0 ? Cell.D : cells[i + 1][j - 1])
        testArray.append(i == 0 ? Cell.D : cells[i - 1][j])
        testArray.append(i == (cells.count - 1) ? Cell.D : cells[i + 1]   [j])
        testArray.append(i == 0 || j == (cells[0].count - 1) ? Cell.D : cells[i - 1][j + 1])
        testArray.append(j == (cells[0].count - 1) ? Cell.D : cells[i][j + 1])
        testArray.append(i == (cells.count - 1) || j == (cells[0].count - 1) ? Cell.D : cells[i + 1][j + 1])
        
        return testArray.filter{ $0 == Cell.A }.count
    }
    
    
    func answers() {
        
        var livableArray: [Cell] = []
        
        for i in 0..<cells.count {
            for j in 0..<cells[0].count {
                if cells[i][j] == Cell.L || cells[i][j] == Cell.A {
                    livableArray.append(cells[i][j])
                }
            }
        }
        liveCultures = livableArray.filter{ $0 == Cell.L }.count
        liveRatio = (Double(liveCultures) / Double(livableArray.count)) * 100
    }
}

