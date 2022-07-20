//
//  ChallangeUI.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 29/06/22.
//

import Foundation

class ChallengeUI: ChallengeBase {
    
    public func verifyAnswer(selected option: Int) -> Bool {
        
        if self.answer == self.options[option - 1] {
            return true
        }
        
        return false
    }
    
    public func showLogo() {
        ConsoleIO.write("\nChallenge Logo\n")
    }
    
    public func showChallange() {
        
        ConsoleIO.write("\n\(self.question)\n\n")
        
        for i in 0..<self.options.count {
            ConsoleIO.write("[\(i + 1)] \(options[i])\n")
        }
        
        ConsoleIO.write("\n[6] Usar item\n[0] Voltar ao Menu Principal\n")
    }
    
}
