//
//  UILabelExtension.swift
//  Xds Food
//
//  Created by Zanette Ciriaco on 27/07/22.
//

import UIKit

extension UILabel {
    
    func RealNumberFormatter(value: Double) {
        
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "pt_BR")
        formatter.numberStyle = .currency
        
        guard let formatted = formatter.string(from: value as NSNumber) else { return }
        
        self.text = "\(formatted)"
    }
}
