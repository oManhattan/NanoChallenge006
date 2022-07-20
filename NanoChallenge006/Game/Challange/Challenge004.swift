//
//  Challenge004.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 07/07/22.
//

import Foundation

/*
 Temple 02, Challenge 01
 
 ax² ± bx ± c = 0
 */

class Challenge004: Challenge {
    
    override func setProblem() {
        
        var validProblem = false
        
        while !validProblem {
            let numA = randomNum(min: -100, max: 100, minAbs: 1)
            let numB = randomNum(min: -100, max: 100, minAbs: 2)
            let numC = randomNum(min: -100, max: 100, minAbs: 2)
            
            var delta = step01(numA: numA, numB: numB, numC: numC)
            
            if delta < 0 || sqrt(Double(delta)).truncatingRemainder(dividingBy: 1) != 0 {
                continue
            }
            
            delta = Int(sqrt(Double(delta)))
          
            let xA = -numB + delta
            let xB = -numB - delta
            
            if xA.isMultiple(of: 2 * numA) && xB.isMultiple(of: 2 * numA) {
                
                validProblem = true
                let answer = [xA / (2 * numA), xB / (2 * numA)]
                
                self.question = setQuestion(numA: numA, numB: numB, numC: numC)
                self.answer = setAnswer(arr: answer)
            }
        }
    }
    
    private func step01(numA: Int, numB: Int, numC: Int) -> Int {
        
        let result = (numB * numB) - (4 * numA * numC)
        
        return result
    }
    
    private func step02(numA: Int, numB: Int, delta: Int) -> [Int] {
        
        let sqrDelta = sqrt(Double(delta))
        
        let xA = (-numB + Int(sqrDelta)) / (2 * numA)
        let xB = (-numB - Int(sqrDelta)) / (2 * numA)
        
        return [xA, xB]
    }
    
    private func setQuestion(numA: Int, numB: Int, numC: Int) -> String{
        
        let str = "\t\(Number.format(numA))𝒙\(Number.format(2, as: .upper)) + \(Number.format(numB))𝒙 + \(Number.format(numC)) = \(Number.format(0))"
        
        return str
    }
    
    public func setAnswer(arr: [Int]) -> String {
        
        if arr[0] != arr[1] {
            return "𝒙\(Number.format(1, as: .under)) = \(arr[0]), 𝒙\(Number.format(2, as: .under)) = \(arr[1])"
        } else {
            return "𝒙 = \(arr[0])"
        }
    }
    
    override func setWrongAnswer() -> String {
        
        var arr = self.answer.split(separator: " ")
        
        if arr.count <= 3 {
            self.answer = String(arr[2])
            let aux = "𝒙 = \(super.setWrongAnswer())"
            self.answer = "𝒙 = \(self.answer)"
            return aux
        }
        
        arr[2].removeLast()
        
        guard let x1 = Int(String(arr[2])), let x2 = Int(String(arr[5])) else {
            return ""
        }
        
        var aux = [x1, x2]
        
        for i in 0..<aux.count {
            aux[i] += Int.random(in: 0...10) - 7
        }
        
        return "𝒙\(Number.format(1, as: .under)) = \(aux[0]), 𝒙\(Number.format(2, as: .under)) = \(aux[1])"
    }
    
    override func showLogo() {
        ConsoleIO.write(FileReader.readContent(file: "desafio01-logo", folder: .logo))
    }
}
