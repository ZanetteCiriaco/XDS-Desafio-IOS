//
//  FoodRatingView.swift
//  Xds Food
//
//  Created by Zanette Ciriaco on 27/07/22.
//

import UIKit

class FoodRatingView: UIStackView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        
        axis = .horizontal
        distribution = .equalSpacing
        spacing = 4
        
        for _ in 0..<5 {
            
            let ratingStar: UIImageView = {
                let view = UIImageView(image: UIImage(named: "grayStarIcon"))
                view.height(13)
                view.width(13)
                return view
            }()
            
            addArrangedSubview(ratingStar)
        }
    }
    
    func setRating(value: Int) {
        var stars:[UIImageView] = []
        
        for case let starsImageView as UIImageView in self.arrangedSubviews {
            stars.append(starsImageView)
        }
        
        for i in 0..<value {
            stars[i].image = UIImage(named: "yellowStarIcon")
        }
    }
    
    
}
