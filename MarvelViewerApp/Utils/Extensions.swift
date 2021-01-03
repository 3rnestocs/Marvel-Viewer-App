//
//  Extensions.swift
//  MarvelViewerApp
//
//  Created by Ernesto Jose Contreras Lopez on 11/22/20.
//

import UIKit

//  MARK: - Quick layout
extension UIView {
    
    func center(inView view: UIView) {
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    
    func anchor(top: NSLayoutYAxisAnchor?, paddingTop: CGFloat,
                bottom: NSLayoutYAxisAnchor?, paddingBottom: CGFloat,
                left: NSLayoutXAxisAnchor?, paddingLeft: CGFloat,
                right: NSLayoutXAxisAnchor?, paddingRight: CGFloat,
                width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top    = top {
            topAnchor.constraint(equalTo    : top,
                                 constant   : paddingTop).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo : bottom,
                                    constant: -paddingBottom).isActive = true
        }
        if let right  = right {
            rightAnchor.constraint(equalTo  : right,
                                   constant : -paddingRight).isActive = true
        }
        if let left   = left {
            leftAnchor.constraint(equalTo   : left,
                                  constant  : paddingLeft).isActive = true
        }
        if width  != 0 {
            widthAnchor.constraint(equalToConstant  : width).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant : height).isActive = true
        }
    }
}

extension UIFont {
    
    func getCustomFont() {
        for family in UIFont.familyNames.sorted() {
            let names = UIFont.fontNames(forFamilyName: family)
            print("Family: \(family) Font names: \(names)")
        }
    }
}

extension String {
    
    var withoutHtmlTags: String {
    return self.replacingOccurrences(of: "<[^>]+>", with: "", options:
    .regularExpression, range: nil).replacingOccurrences(of: "&[^;]+;", with:
    "", options:.regularExpression, range: nil)
    }
}

//MARK: - Custom Colors
enum Colors {
    static let mainWhite    = UIColor(hex: "#F4F4F4ff")
    static let mainRed      = UIColor(hex: "#F0131Eff")
    static let mainGray     = UIColor(hex: "#F0F0F0ff")
    static let mainBlack    = UIColor(hex: "#0D0A0Aff")
}

extension UIColor {
    public convenience init?(hex: String) {
        let r, g, b, a: CGFloat

        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])

            if hexColor.count == 8 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0

                if scanner.scanHexInt64(&hexNumber) {
                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                    a = CGFloat(hexNumber & 0x000000ff) / 255

                    self.init(red: r, green: g, blue: b, alpha: a)
                    return
                }
            }
        }
        return nil
    }
}
