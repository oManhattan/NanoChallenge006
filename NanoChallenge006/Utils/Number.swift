//
//  Numbers.swift
//  NanoChallenge006
//
//  Created by Matheus Cavalcanti de Arruda on 01/07/22.
//

import Foundation

enum NumberFormat {
    case under
    case upper
    case normal
}

class Number {
    
    private static let arrUnder = ["₀", "₁", "₂", "₃", "₄", "₅", "₆", "₇", "₈", "₉"]
    private static let arrUpper = ["⁰", "¹", "²", "³", "⁴", "⁵", "⁶", "⁷", "⁸", "⁹"]
    private static let arrNormal = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
    
    public static func format(_ num: Int, as type: NumberFormat = .normal) -> String {
        
        let arr = separate(num)
        var arrFormat: [String] = []
        
        switch type {
        case .under:
            arrFormat = arrUnder
        case .upper:
            arrFormat = arrUpper
        case.normal:
            arrFormat = arrNormal
        }
        
        var str = ""
        
        for i in arr {
            if !i.isNumber {
                str += i.uppercased()
            } else {
                str += arrFormat[Int(i.asciiValue!) - 48]
            }
        }
        
        if type == .normal {
            return (num < 0) ? "(\(str))" : str
        }
        
        return str
    }
    
    private static func separate(_ num: Int) -> [Character] {
        
        let str = String(num)
        let arr = Array.init(str)
        
        return arr
    }
    
    public static func getMMC(arr: [Int]) -> Int {
        
        guard let divisor = getLowerNum(arr: arr) else { return 0 }
        
        var mmc = 0
        var count = 0
        
        repeat {
            
            mmc += divisor
            count = 0
            
            for num in arr {
                count = mmc.isMultiple(of: num) ? count + 1 : count
            }
            
        } while count < arr.count
        
        return mmc
    }
    
    private static func getLowerNum(arr: [Int]) -> Int? {
        return arr.sorted(by: {$0 < $1}).first
    }
    
    public static func radixFormat(_ num: Int, radix: Int) -> String {
        
        let str = "\(String(num, radix: radix))\(format(radix, as: .under))".uppercased()
        
        return str
    }
}
