//
//  Challenge005.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 11/07/22.
//

import Foundation

/*
 Temple 02, Challenge 02
 
 (ax + b)² - (cx + d)² = 0
 */

class Challenge005: Challenge004 {
    
    override func setProblem() {
        
        var validProblem = false
        
        while !validProblem {
            let ax = randomNum(min: -20, max: 20, minAbs: 1)
            let b = randomNum(min: -20, max: 20, minAbs: 2)
            let cx = randomNum(min: -20, max: 20, minAbs: 1)
            let d = randomNum(min: -20, max: 20, minAbs: 2)
            
            let solvingArray = step01(ax: ax, b: b, cx: cx, d: d)
            
            if solvingArray[0] == 0 { continue }
            
            let delta = sqrt(Double(solvingArray[3]))
            
            if delta.truncatingRemainder(dividingBy: 1) != 0 {
                continue
            }
            
            var x1 = -solvingArray[1] + Int(delta)
            var x2 = -solvingArray[1] - Int(delta)
            
            if x1.isMultiple(of: 2 * solvingArray[0]) && x2.isMultiple(of: 2 * solvingArray[0]) {
                validProblem = true
                
                x1 = x1 / (2 * solvingArray[0])
                x2 = x2 / (2 * solvingArray[0])
                
                self.question = setQuestion(ax: ax, b: b, cx: cx, d: d)
                self.answer = setAnswer(arr: [x1, x2])
            }
        }
    }
    
    private func step01(ax: Int, b: Int, cx: Int, d: Int) -> [Int] {
        
        let numA = (ax * ax) - (cx * cx)
        let numB = (2 * ax * b) - (2 * cx * d)
        let numC = (b * b) - (d * d)
        
        return [numA, numB, numC, (numB * numB) - (4 * numA * numC)]
    }
    
    private func setQuestion(ax: Int, b: Int, cx: Int, d: Int) -> String {
        
        let str = "\t(\(Number.format(ax))𝒙 + \(Number.format(b)))\(Number.format(2, as: .upper)) - (\(Number.format(cx))𝒙 + \(Number.format(d)))\(Number.format(2, as: .upper)) = \(Number.format(0))"
        
        return str
    }
    
    override func showLogo() {
        ConsoleIO.write(FileReader.readContent(file: "desafio02-logo", folder: .logo))
    }
}
