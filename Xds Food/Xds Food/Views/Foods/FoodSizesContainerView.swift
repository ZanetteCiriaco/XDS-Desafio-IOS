//
//  FoodSizesContainerView.swift
//  Xds Food
//
//  Created by Zanette Ciriaco on 27/07/22.
//

import UIKit

protocol FoodSizesContainerViewProtocol: AnyObject {
    func changePriceToShow(price: Double)
}

class FoodSizesContainerView: UIStackView {
    
    weak var delegate: FoodSizesContainerViewProtocol?
    var priceToShow: Double = 0
    
    let foodSizePButton: FoodSizesButton = {
        let button = FoodSizesButton()
        button.title.text = "P"
        button.addTarget(self, action: #selector(onClickButton), for: .touchUpInside)
        return button
    }()
    
    let foodSizeMButton: FoodSizesButton = {
        let button = FoodSizesButton()
        button.title.text = "M"
        button.addTarget(self, action: #selector(onClickButton), for: .touchUpInside)
        return button
    }()
    
    let foodSizeGButton: FoodSizesButton = {
        let button = FoodSizesButton()
        button.title.text = "G"
        button.addTarget(self, action: #selector(onClickButton), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect){
        super.init(frame: frame)
        
        axis = .horizontal
        distribution = .equalSpacing
        
        addArrangedSubview(foodSizePButton)
        addArrangedSubview(foodSizeMButton)
        addArrangedSubview(foodSizeGButton)
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addPricesToButtons(p: Double, m: Double, g: Double) {
        self.foodSizePButton.price = p
        self.foodSizeMButton.price = m
        self.foodSizeGButton.price = g
    }
    
    @objc func onClickButton(_ sender: UIButton) {
        deselectAllButtons()
        sender.isSelected = true
        let button = sender as! FoodSizesButton
        self.delegate?.changePriceToShow(price: button.price)
    }
    
    func deselectAllButtons() {
        for subview in self.arrangedSubviews {
            if let button = subview as? UIButton {
                button.isSelected = false
            }
        }
    }

}
