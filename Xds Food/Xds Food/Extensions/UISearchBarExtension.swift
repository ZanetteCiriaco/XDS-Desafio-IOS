//
//  UISearchBarExtension.swift
//  Xds Food
//
//  Created by Zanette Ciriaco on 28/07/22.
//

import UIKit

extension UISearchBar {
    func setCustomColor() {
        self.backgroundImage = UIImage()
        
        if let textfield = self.value(forKey: "searchField") as? UITextField {
            textfield.backgroundColor = UIColor.white
            textfield.textColor = UIColor.black
            textfield.attributedPlaceholder = NSAttributedString(string: textfield.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor : UIColor.black])
            
            if let leftView = textfield.leftView as? UIImageView {
                    leftView.image = leftView.image?.withRenderingMode(.alwaysTemplate)
                    leftView.tintColor = UIColor.black
            }
        }
    }
}
