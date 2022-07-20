//
//  Challenge007.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 14/07/22.
//

import Foundation

/*
 Temple 03, Challenge 01
 
 converter numero na base x para base y
 */

class Challenge007: Challenge {
    
    let radixArr = [2, 8, 10, 16]
    
    override func setup() {
        setProblem()
    }
    
    override func setProblem() {
        
        var validProblem = false
        
        while !validProblem {
            
            let defaultRadix = radixArr.randomElement()!
            let convertRadix = radixArr.randomElement()!
            
            if defaultRadix == convertRadix { continue }
            
            let num = randomNum(min: 50, max: 400)
            
            self.question = "\t\(String(num, radix: defaultRadix).uppercased())\(Number.format(defaultRadix, as: .under)) = 𝒙\(Number.format(convertRadix, as: .under))"
            
            self.answer = "𝒙 = \(String(num, radix: convertRadix))".uppercased()
            setOptions(num: num, radix: convertRadix)
            validProblem = true
        }
    }
    
    public func setOptions(num: Int, radix: Int) {
        
        self.options.append(self.answer)
        
        while self.options.count < 5 {
            
            let aux = num + randomNum(min: -10, max: 10, minAbs: 1)
            let wrongAnswer = "𝒙 = \(String(aux, radix: radix))".uppercased()
            
            if !self.options.contains(wrongAnswer) {
                self.options.append(wrongAnswer)
            }
        }
        
        self.options.shuffle()
    }
    
    override func showLogo() {
        ConsoleIO.write(FileReader.readContent(file: "desafio01-logo", folder: .logo))
    }
}
