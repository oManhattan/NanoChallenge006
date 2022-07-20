//
//  Challenge009.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 17/07/22.
//

import Foundation

/*
 Temple 03, Challenge 03
 
 (n1 + n2) / n3
 */

class Challenge009: Challenge007 {
    
    override func setProblem() {
        
        let auxArr = radixArr.shuffled()
        let equationArr = setNumberArray()
        
        self.question = setQuestion(equationArr: equationArr, radixArr: auxArr)
        
        let answer = (equationArr[0] + equationArr[1]) / equationArr[2]
        
        self.answer = "𝒙 = \(String(answer, radix: auxArr[3]).uppercased())"
        
        setOptions(num: answer, radix: auxArr[3])
    }
    
    
    private func setNumberArray() -> [Int] {
        var numArr: [Int] = []
        var validNumbers = false
        
        while !validNumbers {
            numArr = randomArray(size: 3, min: 10, max: 150)
            
            if (numArr[0] + numArr[1]).isMultiple(of: numArr[2]) {
                validNumbers = true
            }
        }
        
        return numArr
    }
    
    private func setQuestion(equationArr: [Int], radixArr: [Int]) -> String {
        
        var formattedArr: [String] = []
        
        for i in 0..<equationArr.count {
            formattedArr.append("\(Number.radixFormat(equationArr[i], radix: radixArr[i]))")
        }
        
        let top = "\(formattedArr[0]) + \(formattedArr[1])"
        let line = "\(String(repeating: "–", count: top.count)) = 𝒙\(Number.format(radixArr[3], as: .under))"
        
        let spaceSize = (top.count / 2) - formattedArr[2].count < 0 ? 2 : (top.count / 2) - 1
        
        let bottom = "\(String(repeating: " ", count: spaceSize))\(formattedArr[2])"
        
        
        return "\t\(top)\n\t\(line)\n\t\(bottom)"
    }
    
    override func showLogo() {
        ConsoleIO.write(FileReader.readContent(file: "desafio03-logo", folder: .logo))
    }
}
