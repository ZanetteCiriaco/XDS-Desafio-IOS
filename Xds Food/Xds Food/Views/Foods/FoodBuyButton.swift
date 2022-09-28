//
//  FoodBuyButton.swift
//  Xds Food
//
//  Created by Zanette Ciriaco on 27/07/22.
//

import UIKit

class FoodBuyButton: UIButton {

    let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()

    override init(frame: CGRect){
        super.init(frame: frame)
        
        self.height(76)
        self.backgroundColor = .customGreen
        
        addSubview(title)
        
        title.centerXToSuperview()
        title.centerYToSuperview()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
