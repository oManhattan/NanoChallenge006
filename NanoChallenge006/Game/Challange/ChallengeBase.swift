//
//  ChallengeBase.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 27/06/22.
//

import Foundation

class ChallengeBase {
    
    var question: String = ""
    var answer: String = ""
    var options: [String] = []
    
    init () {
        setup()
    }
    
    func setup() {
        setProblem()
        setOptions()
    }
    
    func setProblem() {}
    
    func setOptions() {}
}
