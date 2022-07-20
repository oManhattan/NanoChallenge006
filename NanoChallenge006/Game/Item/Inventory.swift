//
//  Inventory.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 28/06/22.
//

import Foundation

class Inventory: Codable {
    
    var stacks: [ItemStack] = []
    
    init() {
        
    }
    
    func addItem(item: Item) {
        if let index = inventoryContains(item: item) {
            self.stacks[index].addItem()
        } else {
            self.stacks.append(ItemStack(item: item))
        }
    }
    
    func useItem(hero: Hero) {
        
        if self.stacks.isEmpty {
            
            ConsoleIO.write("\nInventário vazio.\n", as: .perLetter)
            ConsoleIO.wait(seconds: 1)
            
            return
        }
        
        listItems()
        let selectedItem = ConsoleIO.getChoice(options: Array<Int>(0...self.stacks.count))
        
        if selectedItem == 0 { return }
        
        self.stacks[selectedItem - 1].useItem(hero: hero)
        
        if self.stacks[selectedItem - 1].amount <= 0 {
            self.stacks.remove(at: selectedItem - 1)
        }
        
    }
    
    func listItems() {
        ConsoleIO.write("\n")
        for i in 0..<self.stacks.count {
            ConsoleIO.write("[\(i + 1)] - \(self.stacks[i].description)\n")
        }
        ConsoleIO.write("[0] - Cancelar\n")
    }
    
    private func inventoryContains(item: Item) -> Int? {
        for index in 0..<self.stacks.count {
            if self.stacks[index].equals(item: item) {
                return index
            }
        }
        return nil
    }
}
