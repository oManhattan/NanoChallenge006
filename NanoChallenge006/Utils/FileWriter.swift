//
//  FileWriter.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 19/07/22.
//

import Foundation

class FileWriter: FileReader {
    
    public static func write(file: String, content: String) {
        
        let folderPath = getSelectedFolderPath(folder: .save)
        let filePath = folderPath.appendingPathComponent(file).appendingPathExtension("txt")
        
        do {
            try content.write(to: filePath, atomically: true, encoding: .utf8)
        } catch {
            ConsoleIO.write("Erro ao salvar arquivo.", as: .error)
        }
    }
    
    private static func fileExists(file path: URL) -> Bool {
        return path.hasDirectoryPath
    }
}
