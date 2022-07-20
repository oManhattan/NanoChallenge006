//
//  Challange.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 29/06/22.
//

import Foundation

class Challenge: ChallengeUI {
    
    func randomNum(min: Int, max: Int, minAbs: Int? = nil) -> Int {
        var num: Int = 0
        
        var validation = false
        
        while !validation {
            num = Int.random(in: min...max)
            
            if let minAbs = minAbs {
                validation = abs(num) > minAbs
            } else {
                validation = true
            }
        }
        
        return num
    }
    
    func randomArray(size: Int, min: Int, max: Int, minAbs: Int? = nil) -> [Int] {
        
        var arr: [Int] = []
        
        while arr.count < size {
            let aux = randomNum(min: min, max: max, minAbs: minAbs)
            if !arr.contains(aux) {
                arr.append(aux)
            }
        }
        
        return arr
    }
    
    override func setOptions() {
        self.options.append(answer)
        
        repeat {
            
            let aux = setWrongAnswer()
            if !self.options.contains(aux) {
                self.options.append(aux)
            }
        } while self.options.count < 5
        
        self.options.shuffle()
    }
    
    func setWrongAnswer() -> String {
        
        guard let rightAnswerConv = Int(answer) else { return  "" }
        
        var wrongAnswer = rightAnswerConv + Int.random(in: 0...30)
        wrongAnswer -= 15
        
        return "\(wrongAnswer)"
    }
    
}
