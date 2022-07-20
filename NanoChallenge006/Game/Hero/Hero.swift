//
//  Heroi.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 24/06/22.
//

import Foundation

class Hero: Codable {
    
    let name: String
    var healthPoints: Int = 100
    var inventory = Inventory()
    
    init(name: String) {
        self.name = name
    }
    
    func openInventory() {
        inventory.useItem(hero: self)
    }
    
    func takeDamage() {
        
        let damageChance = Int.random(in: 1...100)
        
        if damageChance < 20 {
            ConsoleIO.write("\(name) esquivou.\n")
            return
        }
        
        if damageChance < 85 {
            healthPoints = healthPoints - 15 <= 0 ? 0 : healthPoints - 15
            ConsoleIO.write("\(name) levou 15 de dano.\n")
            return
        }
        
        healthPoints = healthPoints - 25 <= 0 ? 0 : healthPoints - 25
        ConsoleIO.write("\(name) levou 25 de dano.\n")
    }
}
