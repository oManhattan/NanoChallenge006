//
//  Challenge006.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 11/07/22.
//

import Foundation

/*
 Temple 02, Challenge 03

 (a𝒙 + b)² + (c𝒙 - d)² = (e𝒙 + f)²
 –––––––––––––––––––––   –––––––––
           g                 h
 */

class Challenge006: Challenge004 {
    
    override func setProblem() {
        
        var validProblem = false
        
        while !validProblem {
            
            let equationArr = randomArray(size: 8, min: -30, max: 30, minAbs: 3)
            
            let solvingArray = step01(equationArr: equationArr)
            
            if solvingArray[0] == 0 { continue }
            
            var delta = step02(a: solvingArray[0], b: solvingArray[1], c: solvingArray[2])
            
            if delta < 0 { continue }
           
            delta = sqrt(delta)
            
            if delta.truncatingRemainder(dividingBy: 1) != 0 { continue }
            
            var x1 = -solvingArray[1] + Int(delta)
            var x2 = -solvingArray[1] - Int(delta)
            
            if x1.isMultiple(of: 2 * solvingArray[0]) && x2.isMultiple(of: 2 * solvingArray[0]) {
                validProblem = true
                
                x1 = x1 / (2 * solvingArray[0])
                x2 = x2 / (2 * solvingArray[0])
                
                self.question = setQuestion(equationArr: equationArr)
                self.answer = setAnswer(arr: [x1, x2])
            }
        }
    }
    
    private func step01(equationArr: [Int]) -> [Int] {

        var group01 = binomial(numx: equationArr[0], num: equationArr[1])
        let group02 = binomial(numx: equationArr[2], num: -equationArr[3])
        var group03 = binomial(numx: equationArr[4], num: equationArr[5])
        
        group01[0] = group01[0] - group02[0]
        group01[1] = group01[1] - group02[1]
        group01[2] = group01[2] - group02[2]
        
        let mmc = Number.getMMC(arr: [equationArr[6], equationArr[7]])
    
        group01 = multiplyGroup(group: group01, multiplier: mmc / equationArr[6])
        group03 = multiplyGroup(group: group03, multiplier: mmc / equationArr[7])
        
        let a = group01[0] - group03[0]
        let b = group01[1] - group03[1]
        let c = group01[2] - group03[2]
        
        return [a, b, c]
    }
    
    private func step02(a: Int, b: Int, c: Int) -> Double {
        return Double((b * b) - (4 * a * c))
    }
    
    private func binomial(numx: Int, num: Int) -> [Int] {
        
        let a = numx * numx
        let b = 2 * numx * num
        let c = num * num
        
        return [a, b, c]
    }
    
    private func multiplyGroup(group: [Int], multiplier: Int) -> [Int] {
        
        var result: [Int] = []
        
        for i in group {
            result.append(multiplier * i)
        }
        
        return result
    }
    
    private func setQuestion(equationArr: [Int]) -> String {
        let top01 = "(\(Number.format(equationArr[0]))𝒙 + \(Number.format(equationArr[1])))² - (\(Number.format(equationArr[2]))𝒙 - \(Number.format(equationArr[3])))²"
        let top02 = "(\(Number.format(equationArr[4]))𝒙 + \(Number.format(equationArr[5])))²"
        
        let line = "\(String(repeating: "–", count: top01.count)) = \(String(repeating: "–", count: top02.count))"
        
        let bottom01 = "\(Number.format(equationArr[6]))"
        let bottom02 = "\(Number.format(equationArr[7]))"
        
        let bottom = "\(String(repeating: " ", count: (top01.count / 2) - bottom01.count ))\(bottom01)\(String(repeating: " ", count: top01.count / 2))   \(String(repeating: " ", count: (top02.count / 2) - bottom02.count + 1))\(bottom02)\(String(repeating: " ", count: top02.count / 2))"
        
        return "\n\n\t\(top01)   \(top02)\n\t\(line)\n\t\(bottom)"
    }
    
    override func showLogo() {
        ConsoleIO.write(FileReader.readContent(file: "desafio03-logo", folder: .logo))
    }
}
