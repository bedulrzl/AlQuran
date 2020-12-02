//
//  ColorHex.swift
//  AlQuran
//
//  Created by Aprizal on 5/5/20.
//  Copyright © 2020 Aprizal. All rights reserved.
//

import UIKit

extension UIColor {
    static let primaryText = UIColor(hex: 0x121212)
    static let secondText = UIColor(hex: 0xAAAAAA)
    static let darkGreen = UIColor(hex: 0x186049)
    static let normalGreen = UIColor(hex: 0x247158)
    static let lightGreen = UIColor(hex: 0xED5B66)
    static let lightBrown = UIColor(hex: 0xE4D5C7)
    
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0){
        self.init(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: a
        )
    }
    
    convenience init(hex: Int, a: CGFloat = 1.0){
        self.init(
            red: (hex >> 16) & 0xFF,
            green: (hex >> 8) & 0xFF,
            blue: hex & 0xFF,
            a: a
        )
    }
    
}
