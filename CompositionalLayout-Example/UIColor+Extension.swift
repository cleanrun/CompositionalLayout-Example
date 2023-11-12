//
//  UIColor+Extension.swift
//  CompositionalLayout-Example
//
//  Created by cleanmac on 12/11/23.
//

import UIKit

extension UIColor {
    class var random: UIColor {
        UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
    }
}
