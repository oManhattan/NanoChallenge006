//
//  FileEditor.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 20/07/22.
//

import Foundation

class FileEditor: FileWriter {
    
    public static func deleteFile(folder: ContentType, file name: String) {
        
        let folder = getSelectedFolderPath(folder: folder)
        let file = folder.appendingPathComponent(name).appendingPathExtension("txt")
        
        do {
            try FileManager.default.removeItem(atPath: file.path)
        } catch {
            ConsoleIO.write("Arquivo não encontrado", as: .error)
        }
    }
    
}
