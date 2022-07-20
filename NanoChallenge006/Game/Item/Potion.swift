//
//  Potion.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 27/06/22.
//

import Foundation

class Potion: Item {
    
    let heal = 20
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
    
    init() {
        super.init(name: "Poção de vida", id: 1)
    }
    
    override func use(hero: Hero) -> Bool {
        
        if hero.healthPoints >= 100 {
            return false
        }
        
        hero.healthPoints = (hero.healthPoints + self.heal > 100) ? 100 : hero.healthPoints + self.heal
        
        ConsoleIO.write("\(hero.name) recebeu \(heal) de cura.\n", as: .perLetter)
        
        return true
    }
}
