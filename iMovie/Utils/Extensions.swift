//
//  Extensions.swift
//  iMovie
//
//  Created by SHABEERALI K on 27/04/20.
//  Copyright © 2020 SHABEERALI K. All rights reserved.
//

import Foundation
import UIKit
extension UIColor {
    
    /// This converts Hex Color code to swift color
    /// - Parameters:
    ///   - hexString: hex color in  String format
    ///   - alpha: alpha value
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
}

extension UIViewController {
    open override func awakeFromNib() {
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
}

extension CALayer {
    
    /// This applies shadow for all kind of Layes
    /// - Parameters:
    ///   - color: color
    ///   - alpha: alpha value
    ///   - x: x
    ///   - y: y
    ///   - blur: blur value
    ///   - spread: spread range
    func applySketchShadow(color: UIColor = .black, alpha: Float = 0.5,
                         x: CGFloat = 0, y: CGFloat = 3, blur: CGFloat = 6,
                         spread: CGFloat = 0) {
        shadowColor = color.cgColor
        shadowOpacity = alpha
        shadowOffset = CGSize(width: x, height: y)
        shadowRadius = blur / 2.0
        if spread == 0 {
          shadowPath = nil
        } else {
          let dx = -spread
          let rect = bounds.insetBy(dx: dx, dy: dx)
          shadowPath = UIBezierPath(rect: rect).cgPath
        }
    }
}
