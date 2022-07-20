//
//  Challange002.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 29/06/22.
//

import Foundation

/*
 Temple 01, Challenge 02
 
 ax ± b   dx ± e
 –––––– = ––––––
    c        f
 */

class Challenge002: Challenge {
    
    override func setProblem() {
        
        var validQuestion = false
        
        while !validQuestion {
            
            let numAx = randomNum(min: -100, max: 100, minAbs: 10) //0
            let numB = randomNum(min: -1000, max: 1000, minAbs: 10) //1
            let numC = randomNum(min: -15, max: 15, minAbs: 2) //2
            
            let numDx = randomNum(min: -100, max: 100, minAbs: 10) //3
            let numE = randomNum(min: -1000, max: 1000, minAbs: 10) //4
            let numF = randomNum(min: -15, max: 15, minAbs: 2) //5
            
            let numX = (numAx * numF) - (numDx * numC)
            let numN = (numE * numC) - (numB * numF)
            
            if numN.isMultiple(of: numX) {
                question = setQuestion(arr: [numAx, numB, numC, numDx, numE, numF])
                answer = "\(numN / numX)"
                
                validQuestion = true
            }
        }
    }
    
    override func showLogo() {
        ConsoleIO.write(FileReader.readContent(file: "desafio02-logo", folder: .logo))
    }
    
    private func setQuestion(arr: [Int]) -> String {
        
        let top01 = "\(Number.format(arr[0]))𝒙 + \(Number.format(arr[1]))"
        let top02 = "\(Number.format(arr[3]))𝒙 + \(Number.format(arr[4]))"
        
        let divisor01 = "\(Number.format(arr[2]))"
        let divisor02 = "\(Number.format(arr[5]))"
        
        let space01 = ((top01.count / 2) - divisor01.count) < 1 ? 3 : (top01.count / 2) - divisor01.count
        let space02 = ((top02.count / 2) - divisor02.count) < 1 ? 3 : (top02.count / 2) - divisor02.count
        
        let line = "\(String(repeating: "–", count: top01.count)) = \(String(repeating: "–", count: top02.count))"
        
        let divisors = "\(String(repeating: " ", count: space01))\(divisor01)\(String(repeating: " ", count: top01.count / 2))   \(String(repeating: " ", count: space02))\(divisor02)\(String(repeating: " ", count: top02.count / 2))"
        
        
        return "\t\(top01)   \(top02)\n\t\(line)\n\t\(divisors)"
    }
}
