//
//  Menu.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 24/06/22.
//

import Foundation

class Menu {
    
    public static func mainMenu() {
        
        ConsoleIO.write(FileReader.readContent(file: "main-menu", folder: .menu))
        
        var exitGame = false
            
        while !exitGame {
            let choice = ConsoleIO.getChoice(options: [0, 1, 2, 3])
            
            switch choice {
            case 1:
                if let game = playMenu() {
                    game.start()
                }
            case 2:
                readOnlyMenu(menu: "instrucoes")
            case 3:
                readOnlyMenu(menu: "creditos")
            case 0:
                ConsoleIO.write("Jogo Encerrado.\n")
                exitGame = true
                continue
            default:
                continue
            }
            
            ConsoleIO.write(FileReader.readContent(file: "main-menu", folder: .menu))
        }
    }
    
    private static func readOnlyMenu(menu name: String) {
        ConsoleIO.write(FileReader.readContent(file: name, folder: .menu) + "\n")
        ConsoleIO.write("[0] Voltar\n")
        let _ = ConsoleIO.getChoice(options: [0])
    }
    
    public static func playMenu() -> Game? {

        var exitMenu = false
        
        while !exitMenu {
            ConsoleIO.write(FileReader.readContent(file: "jogar", folder: .menu))
            let choice = ConsoleIO.getChoice(options: [0, 1, 2])
            
            switch choice {
            case 0:
                exitMenu = true
            case 1:
                return GameManager.newGame()
            case 2:
                if let game = GameManager.getSavedGame() { return game }
            default:
                break
            }
        }
        
        return nil
    }
}
