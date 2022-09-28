//
//  FoodSizesView.swift
//  Xds Food
//
//  Created by Zanette Ciriaco on 27/07/22.
//

import UIKit

class FoodSizesButton: UIButton {
    
    override open var isSelected: Bool {
        didSet {
            self.title.textColor = isSelected ? .white : .black
            self.backgroundColor = isSelected ? .customGreen : .white
        }
    }
    
    var price: Double = 0
    
    let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()

    override init(frame: CGRect){
        super.init(frame: frame)
        
        self.layer.cornerRadius = 10
        self.height(46)
        self.width(80)
        self.backgroundColor = .white
        
        addSubview(title)
        
        title.centerXToSuperview()
        title.centerYToSuperview()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
