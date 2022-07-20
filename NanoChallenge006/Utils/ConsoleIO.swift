//
//  ConsoleIO.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 14/06/22.
//

import Foundation

enum PritType {
    case instant
    case perLetter
    case perWord
    case perLine
    case error
}

protocol ConsoleOutput {
    static func write(_ text: String, as type: PritType)
}

protocol ConsoleInput {
    static func read() -> String?
    static func readInt() -> Int?
}

class ConsoleIO: ConsoleOutput {
    
    static func write(_ text: String, as type: PritType = .instant) {
        switch type {
        case .instant:
            print(text, terminator: "")
        case .perLetter:
            printPerLetter(text)
        case .perWord:
            printPerWord(text)
        case .perLine:
            printPerLine(text)
        case .error:
            print("Erro: \(text)")
        }
    }
    
    private static func printPerLetter(_ text: String) {
        let arr = Array.init(text)
        
        for letter in arr {
            usleep(106000)
            print(letter, terminator: "")
        }
    }
    
    private static func printPerWord(_ text: String) {
        let arr = text.split(separator: " ")
        
        for word in arr {
            usleep(250000)
            print("\(word)", terminator: " ")
        }
    }
    
    private static func printPerLine(_ text: String) {
        let arr = text.split(separator: "\n")
        
        for line in arr {
            usleep(300000)
            print("\(line)", terminator: "\n")
        }
    }
    
    public static func wait(seconds: Int) {
        usleep(useconds_t(seconds * 100000))
    }
}

extension ConsoleIO: ConsoleInput {
    static func read() -> String? {
        guard let text = readLine(), !text.isEmpty else {
            return nil
        }
        return text
    }
    
    static func readInt() -> Int? {
        guard let text = read(), let num = Int(text) else {
            return nil
        }
        return num
    }
}

extension ConsoleIO {
    
    static func getChoice(options: [Int]) -> Int {
        
        var validChoice = false
        var choice = -1
        
        while !validChoice {
            write("\nEscolha: ")
            choice = readInt() ?? -1
            
            switch choice {
            case _ where options.contains(choice):
                validChoice = true
            default:
                write("Opção inválida.", as: .error)
            }
        }
        
        return choice
    }
    
}
