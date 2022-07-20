//
//  Challange003.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 04/07/22.
//

import Foundation

/*
 Temple 01, Challenge 03
 
    a0 (bx1 ± c2)   e3 (f4x ± g5)   i6 (j7x ± k8)
    ------------- + ------------- = -------------
          d0              h1             l2
 */

class Challenge003: Challenge {
    
    override func setProblem() {
        
        var validProblem = false
        
        while !validProblem {
            let upperNum = randomArray(size: 9, min: -50, max: 50, minAbs: 2)
            let downNum = randomArray(size: 3, min: -15, max: 15, minAbs: 2)
            var solvingArray: [Int] = []
            
            solvingArray = step01(arr: upperNum)
            solvingArray = step02(upArr: solvingArray, downArr: downNum)
            solvingArray = step03(arr: solvingArray)
            
            if solvingArray[1].isMultiple(of: solvingArray[0]) {
                self.question = setQuestion(upArr: upperNum, downArr: downNum)
                self.answer = "\(solvingArray[1] / solvingArray[0])"
                validProblem = true
            }
        }
        
    }
    
    private func step01(arr: [Int]) -> [Int] {
        
        var result: [Int] = []
        
        for i in 0..<arr.count {
            if i.isMultiple(of: 3) {
                result.append(arr[i + 1] * arr[i])
                result.append(arr[i + 2] * arr[i])
            }
        }
        
        return result
    }
    
    private func step02(upArr: [Int], downArr: [Int]) -> [Int] {
        let mmc = Number.getMMC(arr: downArr)
        var newDown: [Int] = []
        var result: [Int] = []
        
        for num in downArr {
            newDown.append(mmc / num)
        }
        
        var count = -1
        
        for i in 0..<upArr.count {
            if i.isMultiple(of: 2) {
                count += 1
            }
            
            result.append(upArr[i] * newDown[count])
        }
        
        return result
    }
    
    private func step03(arr: [Int]) -> [Int] {
        
        var result: [Int] = []
        
        result.append(arr[0] + arr[2] - arr[4])
        result.append(arr[5] - arr[3] - arr[1])
        
        return result
    }
    
    private func setQuestion(upArr: [Int], downArr: [Int]) -> String {
        
        var line01 = ""
        var line02 = ""
        var line03 = ""
        
        var count = 0
        
        for i in 0..<upArr.count {
            if i.isMultiple(of: 3) {
                let aux = "\(Number.format(upArr[i])) (\(Number.format(upArr[i + 1]))𝒙 + \(Number.format(upArr[i + 2])))"
                
                if i == 0 {
                    line01 += "\(aux) + "
                } else if i == 3 {
                    line01 += "\(aux) = "
                } else {
                    line01 += aux
                }
                
                line02 += String(repeating: "–", count: aux.count) + "   "
                
                line03 += "\(String(repeating: " ", count: (aux.count / 2) - 1))\(Number.format(downArr[count]))\(String(repeating: " ", count: (aux.count / 2) - 1))   "
                count += 1
            }
        }
        
        return "\t\(line01)\n\t\(line02)\n\t\(line03)"
    }
    
    override func showLogo() {
        ConsoleIO.write(FileReader.readContent(file: "desafio03-logo", folder: .logo))
    }
}
