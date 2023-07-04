//
//  File.swift
//  PokemonApp
//
//  Created by Prizega  on 10/05/23.
//

import Foundation
import UIKit

extension UIColor {
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        hexFormatted = hexFormatted.replacingOccurrences(of: "#", with: "")

        var rgbValue: UInt32 = 0
        Scanner(string: hexFormatted).scanHexInt32(&rgbValue)

        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    static var orangeCustom: UIColor {
        return UIColor(hex: "#FFB444")
    }
    
    static var greenCustom: UIColor {
        return UIColor(hex: "#B2FFE2")
    }
    
    static var blueCustom: UIColor {
        return UIColor(hex: "#ADDAEE")
    }
    
    static var blackCustom: UIColor {
        return UIColor(hex: "#232323")
    }
    
    
}
