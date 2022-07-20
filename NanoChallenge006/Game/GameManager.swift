//
//  GameManager.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 19/07/22.
//

import Foundation

class GameManager {
    
    public static func save(game: Game) {
        
        guard let content = encodeGame(game: game) else {
            ConsoleIO.write("Falha ao salvar progresso.", as: .error)
            return
        }
        let file = "save-\(game.save)"
        FileEditor.write(file: file, content: content)
    }
    
    public static func loadGame(save file: String) -> Game? {
        let gameContent = FileEditor.readContent(file: file, folder: .save)
        let game = decodeGame(game: gameContent)
        return game
    }
    
    public static func encodeGame(game: Game) -> String? {
        do {
            let encodeData = try JSONEncoder().encode(game)
            let jsonString = String(data: encodeData, encoding: .utf8)
            return jsonString
        } catch {
            ConsoleIO.write("Falha ao converter arquivo: 1", as: .error)
            return nil
        }
    }
    
    public static func decodeGame(game: String) -> Game? {
        do {
            let aux = game.data(using: .utf8)!
            let game = try JSONDecoder().decode(Game.self, from: aux)
            return game
        } catch {
            ConsoleIO.write("Falha ao converter arquivo: 2", as: .error)
            return nil
        }
    }
    
    public static func deleteGame(game: Game) {
        let file = "save-\(game.save)"
        FileEditor.deleteFile(folder: .save, file: file)
    }
    
    public static func newGame() -> Game {
        
        ConsoleIO.write(FileReader.readContent(file: "novo-jogo", folder: .logo))
        var validName = false
        var name = ""
        
        while !validName {
            
            ConsoleIO.write("\nEscolha o nome de seu personagem: ")
            name = ConsoleIO.read()!
            
            ConsoleIO.write("\nTem certeza que o nome será \(name)\n\n")
            ConsoleIO.write("[1] - Sim\t[2] - Não\n")
            
            if ConsoleIO.getChoice(options: [1, 2]) == 1 {
                validName = true
            }
        }
        let save = getNewSaveNum()
        let game = Game(name: name, save: save)
        self.save(game: game)
        return game
    }
    
    public static func getSavedGame() -> Game? {
        let list = getSavedGamesFiles()
        
        if list.isEmpty {
            ConsoleIO.write("\nNenhum progresso salvo.\n")
            return nil
        }
        
        ConsoleIO.write(FileReader.readContent(file: "carregar-jogo", folder: .logo) + "\n")
        showSavedGames(list: list)
        
        let choice = ConsoleIO.getChoice(options: .init(0...list.count))
        if choice == 0 { return nil }
        let savedGame = list[choice - 1]
        return loadGame(save: savedGame)
    }
    
    public static func showSavedGames(list: [String]) {
        
        for i in 0..<list.count {
            let game = loadGame(save: list[i])
            ConsoleIO.write("[\(i + 1)] \(game?.describing ?? "N/A")\n")
        }
        
        ConsoleIO.write("\n[0] Voltar\n")
    }
    
    public static func loadChallenge(num: Int) -> Challenge {
        switch num {
        case 1:
            return Challenge001()
        case 2:
            return Challenge002()
        case 3:
            return Challenge003()
        case 4:
            return Challenge004()
        case 5:
            return Challenge005()
        case 6:
            return Challenge006()
        case 7:
            return Challenge007()
        case 8:
            return Challenge008()
        case 9:
            return Challenge009()
        case 10:
            return Challenge010()
        default:
            ConsoleIO.write("Problema ao carregar desafio.", as: .error)
            return Challenge()
        }
    }
    
    private static func getSavedGamesFiles() -> [String] {
        let list = FileEditor.readAllFileNameFromFolder(folder: .save)
        return formatFileName(arr: list)
    }
    
    private static func formatFileName(arr: [String]) -> [String] {
        
        var newArr: [String] = []
        
        for file in arr {
            if !file.contains("save") { continue }
            let aux = file.split(separator: ".")
            newArr.append("\(aux[0])")
        }
        
        return newArr
    }
    
    private static func getNewSaveNum() -> Int {
        let list = getSavedGamesFiles()
        var saveNum = 1
        
        for file in list {
            let aux = file.split(separator: "-")
            saveNum = (saveNum == (Int(aux[1]) ?? saveNum)) ? saveNum + 1 : saveNum
        }
        
        return saveNum
    }
}
