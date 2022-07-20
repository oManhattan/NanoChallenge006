//
//  File.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 27/06/22.
//

import Foundation

/*
 Temple 01, Challenge 01
 
 ax ± b = 0
 */

class Challenge001: Challenge {
    
    override func setProblem() {
        var validAnswer = false
        
        while !validAnswer {
            let numA = randomNum(min: -100, max: 100, minAbs: 10)
            let numB = randomNum(min: -10000, max: 10000, minAbs: 10)
            
            if numB.isMultiple(of: numA) {
                validAnswer = true
                self.question = setQuestion(numA: numA, numB: numB)
                self.answer = "\(-numB / numA)"
            }
        }
    }
    
    override func showLogo() {
        ConsoleIO.write(FileReader.readContent(file: "desafio01-logo", folder: .logo))
    }
    
    private func setQuestion(numA: Int, numB: Int) -> String {
        
        let str = "\t\(Number.format(numA))𝒙 ﹢ \(Number.format(numB)) ﹦ \(Number.format(0))"
        
        return str
    }
}
