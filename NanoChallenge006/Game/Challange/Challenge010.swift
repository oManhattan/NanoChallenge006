//
//  Challenge010.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 17/07/22.
//

import Foundation
/*
 Final Challenge
 
 (0ax ± 1b) (2cx ± 3d) = 0
 
 */

class Challenge010: Challenge007 {
    
    override func setProblem() {
        
        var validEquation = false
        
        while !validEquation {
         
            let equationArr = randomArray(size: 4, min: 20, max: 100)
            let bhaskaraArr = setBhaskara(equationArr: equationArr)
          
            var delta = getDelta(a: bhaskaraArr[0], b: bhaskaraArr[1], c: bhaskaraArr[2])
            
            if delta < 0 { continue }
          
            delta = sqrt(delta)
            
            if delta.truncatingRemainder(dividingBy: 1) != 0 {
                continue
            }
      
            let divider = 2 * bhaskaraArr[0]
            
            var x1 = -bhaskaraArr[1] + Int(delta)
            var x2 = -bhaskaraArr[1] - Int(delta)
            
            if x1.isMultiple(of: divider) && x2.isMultiple(of: divider) {
                
                validEquation = true
    
                x1 = x1 / divider
                x2 = x2 / divider
    
                self.question = setQuestion(equationArr: equationArr)
                let answerRadix = self.radixArr.randomElement()!
                self.answer = setAnswer(x1: x1, x2: x2, radix: answerRadix)
                setOptions(x1: x1, x2: x2, radix: answerRadix)
            }
        }
    }
    
    private func setBhaskara(equationArr: [Int]) -> [Int] {
        
        let numx2 = equationArr[0] * equationArr[2]
        let numx = (equationArr[0] * equationArr[3]) + (equationArr[1] * equationArr[2])
        let num = equationArr[1] * equationArr[3]
        
        return [numx2, numx, num]
    }
    
    private func getDelta(a: Int, b: Int, c: Int) -> Double {
        return Double((b * b) - (4 * a * c))
    }
    
    private func setAnswer(x1: Int, x2: Int, radix: Int) -> String {
        
        if x1 == x2 {
            return "𝒙 = \(Number.radixFormat(x1, radix: radix))"
        }
        
        return "𝒙\(Number.format(1, as: .under)) = \(Number.radixFormat(x1, radix: radix)), 𝒙\(Number.format(2, as: .under)) = \(Number.radixFormat(x2, radix: radix))"
    }
    
    private func setQuestion(equationArr: [Int]) -> String {
        
        var formattedArr: [String] = []
        
        for i in equationArr {
            formattedArr.append(Number.radixFormat(i, radix: self.radixArr.randomElement()!))
        }
        
        return "\t(\(formattedArr[0])𝒙 + \(formattedArr[1])) (\(formattedArr[2])𝒙 + \(formattedArr[3])) = 0"
    }
    
    private func setOptions(x1: Int, x2: Int, radix: Int) {
        self.options.append(self.answer)
        
        if x1 == x2 {
            while self.options.count < 5 {
                let aux = x1 + randomNum(min: -10, max: 10, minAbs: 1)
                let wrongAnswer = "𝒙 = \(Number.radixFormat(aux, radix: radix))"
                if !self.options.contains(wrongAnswer) {
                    self.options.append(wrongAnswer)
                }
            }
        } else {
            while self.options.count < 5 {
                let aux1 = x1 + randomNum(min: -10, max: 10, minAbs: 1)
                let aux2 = x2 + randomNum(min: -10, max: 10, minAbs: 1)
                if aux1 == aux2 { continue }
                let wrongAnswer = "𝒙\(Number.format(1, as: .under)) = \(Number.radixFormat(aux1, radix: radix)), x\(Number.format(2, as: .under)) = \(Number.radixFormat(aux2, radix: radix))"
                if !self.options.contains(wrongAnswer) {
                    self.options.append(wrongAnswer)
                }
            }
        }
        self.options.shuffle()
    }
    
    override func showLogo() {
        ConsoleIO.write(FileReader.readContent(file: "desafio-final-logo", folder: .logo))
    }
}
