//
//  ItemStack.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 27/06/22.
//

import Foundation

class ItemStack: Codable {
    
    let item: Item
    var amount: Int = 1
    var description: String {
        return "\(self.item.description) | Quantidade: \(self.amount)"
    }
    
    init(item: Item) {
        self.item = item
    }
    
    func addItem() {
        self.amount += 1
    }
    
    func useItem(hero: Hero) {
        self.amount = (item.use(hero: hero)) ? self.amount - 1 : self.amount
    }
    
    func equals(item: Item) -> Bool {
        return self.item.equals(item: item)
    }
}
