//
//  Item.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 27/06/22.
//

import Foundation

class Item: Codable {
    
    var id: Int
    var name: String
    var description: String {
        return "\(self.name)"
    }
    
    init(name: String, id: Int) {
        self.id = id
        self.name = name
    }

    public func use(hero: Hero) -> Bool {
        return false
    }
    
    public func equals(item: Item) -> Bool {
        return (self.id == item.id) ? true : false
    }
}
