//
//  Game.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 28/06/22.
//

import Foundation

class Game: Codable {

    var progress: Int = 1
    var gameOver: Bool = false
    var save: Int
    var hero: Hero
    
    var describing: String {
        return "\(self.hero.name) | HP: \(self.hero.healthPoints) | \(showProgress())"
    }
    
    init(name: String, save: Int) {
        self.hero = .init(name: name)
        self.save = save
    }
    
    public func start() {
        
        for i in progress...10 {
            loadHistory(num: i)
            let challenge = GameManager.loadChallenge(num: i)
            let didPass = playChallenge(challenge)
            if !didPass {
                GameManager.save(game: self)
                return
            }
            
            if self.gameOver {
                showGameOver()
                GameManager.deleteGame(game: self)
                return
            } else {
                ConsoleIO.write("\nUma poção foi adicionada ao inventário de \(hero.name).\n\n", as: .perLetter)
                self.hero.inventory.addItem(item: Potion())
                self.progress += 1
                GameManager.save(game: self)
            }
        }
    }
    
    public func playChallenge(_ challenge: Challenge) -> Bool {
        
        challenge.showLogo()
        var endChallenge = false
        
        while !endChallenge && self.hero.healthPoints > 0 {
                
            challenge.showChallange()
            
            ConsoleIO.write("\nHP: \(hero.healthPoints)\n")
            
            let choice = ConsoleIO.getChoice(options: [0, 1, 2, 3, 4, 5, 6])
            
            switch choice {
            case 1...5:
                if challenge.verifyAnswer(selected: choice) {
                    endChallenge = true
                    ConsoleIO.write("\nResposta certa.\n")
                } else {
                    ConsoleIO.write("\nResposta errada.\n")
                    self.hero.takeDamage()
                }
            case 0:
                endChallenge = true
                return false
            case 6:
                hero.openInventory()
            default:
                break
            }
        }
        
        self.gameOver = self.hero.healthPoints <= 0
        return true
    }
    
    private func loadHistory(num: Int) {
        switch num {
        case 1:
            intro()
            temple01Start()
        case 4:
            temple01End()
            temple02Start()
        case 7:
            temple02End()
            temple03Start()
        case 10:
            temple03End()
            finalBossStart()
        default:
            break
        }
    }
    
    private func showProgress() -> String {
        switch self.progress {
        case 1...3:
            return "Templo Equação Primeiro Grau, Desafio \(self.progress)"
        case 4...6:
            return "Templo Equação Segundo Grau, Desafio \(self.progress - 3)"
        case 7...9:
            return "Templo Conversão de Base, Desafio \(self.progress - 6)"
        case 10:
            return "Chefão Pitagoron, Desafio Final"
        default:
            return "N/A"
        }
    }
    
    private func intro() {
        ConsoleIO.write(FileReader.readContent(file: "game-intro-logo", folder: .logo))
        ConsoleIO.write(FileReader.readHistoryReplacingHeroName(file: "game-intro", hero: hero), as: .perLine)
    }
    
    private func temple01Start() {
        ConsoleIO.write(FileReader.readContent(file: "templo001-logo", folder: .logo))
        ConsoleIO.write(FileReader.readHistoryReplacingHeroName(file: "templo001-intro", hero: hero), as: .perLine)
    }
    
    private func temple01End() {
        ConsoleIO.write(FileReader.readHistoryReplacingHeroName(file: "templo001-final", hero: hero), as: .perLine)
    }
    
    private func temple02Start() {
        ConsoleIO.write(FileReader.readContent(file: "templo002-logo",folder: .logo))
        ConsoleIO.write(FileReader.readHistoryReplacingHeroName(file: "templo002-intro", hero: hero), as: .perLine)
    }
    
    private func temple02End() {
        ConsoleIO.write(FileReader.readHistoryReplacingHeroName(file: "templo002-final", hero: hero), as: .perLine)
    }
    
    private func temple03Start() {
        ConsoleIO.write(FileReader.readContent(file: "templo003-logo", folder: .logo))
        ConsoleIO.write(FileReader.readHistoryReplacingHeroName(file: "templo003-intro", hero: hero), as: .perLine)
    }
    
    private func temple03End() {
        ConsoleIO.write(FileReader.readHistoryReplacingHeroName(file: "templo003-final", hero: hero), as: .perLine)
    }
    
    private func finalBossStart() {
        
    }
    
    private func finalBossEnd() {
        
    }
    
    private func showGameOver() {
        ConsoleIO.write(FileReader.readContent(file: "game-over", folder: .logo))
    }
}
