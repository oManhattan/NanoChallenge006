//
//  FileReader.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 23/06/22.
//

import Foundation

class FileReader {
    
    enum ContentType: String {
        case history = "history"
        case logo = "logo"
        case menu = "menu"
        case save = "save"
    }
    
    public static func readContent(file name: String, folder: ContentType) -> String {
        
        let folder = getSelectedFolderPath(folder: folder)
        let txtDir = folder
            .appendingPathComponent(name)
            .appendingPathExtension("txt")
        
        var content = ""
        
        do {
            content = try String(contentsOfFile: txtDir.path)
        } catch {
            ConsoleIO.write("Não foi possível carregar o arquivo.\n", as: .error)
            return ""
        }
        
        return content
    }
    
    public static func readHistoryReplacingHeroName(file name: String, hero: Hero) -> String {
        
        let content = readContent(file: name, folder: .history).replacingOccurrences(of: "nomeJogador", with: hero.name)
        
        return content
    }
    
    public static func getSelectedFolderPath(folder type: ContentType) -> URL {
        
        let path = FileManager.default.homeDirectoryForCurrentUser
            .appendingPathComponent("nano006content")
            .appendingPathComponent(type.rawValue)
        
        return path
    }
    
    public static func readAllFileNameFromFolder(folder: ContentType) -> [String] {
        let path = getSelectedFolderPath(folder: folder)
        var fileList: [String] = []
        
        do {
            try fileList = FileManager.default.contentsOfDirectory(atPath: path.path)
        } catch {
            ConsoleIO.write("Falha ao tentar ler os conteúdos de \(path.path)")
        }
        
        return fileList
    }
}
