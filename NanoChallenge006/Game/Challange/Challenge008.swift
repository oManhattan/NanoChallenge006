//
//  Challenge008.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 15/07/22.
//

import Foundation

/*
 Temple 03, Challenge 02
 
 converter soma em uma base para outra
 */

class Challenge008: Challenge007 {
    
    override func setProblem() {
        
        var auxArr = radixArr.shuffled()
        
        let n1Radix = auxArr.removeFirst()
        let n2Radix = auxArr.removeFirst()
        let answerRadix = auxArr.removeFirst()
        
        let n1 = randomNum(min: 40, max: 100)
        let n2 = randomNum(min: 40, max: 100)
        
        self.question = "\(Number.radixFormat(n1, radix: n1Radix)) + \(Number.radixFormat(n2, radix: n2Radix)) = 𝒙\(Number.format(answerRadix, as: .under))"
        
        self.answer = "𝒙 = \(String(n1 + n2, radix: answerRadix))"
        
        setOptions(num: n1 + n2, radix: answerRadix)
    }
    
    override func showLogo() {
        ConsoleIO.write(FileReader.readContent(file: "desafio02-logo", folder: .logo))
    }
}
