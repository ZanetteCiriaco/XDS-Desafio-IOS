//
//  FoodsTableViewCell.swift
//  Xds Food
//
//  Created by Zanette Ciriaco on 26/07/22.
//

import UIKit
import TinyConstraints
import Kingfisher

class FoodsTableViewCell: UITableViewCell {
    
    static let identifier = "FoodsTableViewCell"
    
    var pizza: Food? {
        didSet {
            self.title.text = pizza?.name
            self.setCardImage(url: pizza?.imageUrl ?? "")
            self.priceLabel.RealNumberFormatter(value: pizza?.priceP ?? 0)
            self.ratingView.setRating(value: pizza?.rating ?? 0)
        }
    }
    
    let cardContainer: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundGray
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner]
        return view
    }()
    
    let cardImage: UIImageView = {
        let view = UIImageView()
        view.width(175)
        view.height(100)
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMinXMinYCorner]
        return view
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    let fromLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.text = "a partir de:"
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    let ratingView: FoodRatingView = {
        let view = FoodRatingView()
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func configureView() {
        
        backgroundColor = .clear
        selectionStyle = .none

        addSubview(cardContainer)
        addSubview(cardImage)
        cardContainer.addSubview(title)
        cardContainer.addSubview(fromLabel)
        cardContainer.addSubview(priceLabel)
        cardContainer.addSubview(ratingView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        cardImage.topToSuperview(offset: 7)
        cardImage.bottomToSuperview(offset: -7)
        cardImage.leftToSuperview(offset: 15)
        
        cardContainer.topToSuperview(offset: 7)
        cardContainer.leftToRight(of: cardImage)
        cardContainer.bottomToSuperview(offset: -7)
        cardContainer.rightToSuperview(offset: -15)
        
        title.topToSuperview(offset: 10)
        title.leftToSuperview(offset: 8)
        title.rightToSuperview()
        
        fromLabel.topToBottom(of: title, offset: 9)
        fromLabel.leftToSuperview(offset: 7.47)
        
        priceLabel.topToBottom(of: fromLabel)
        priceLabel.left(to: fromLabel)
        
        ratingView.bottomToSuperview(offset: -6)
        ratingView.rightToSuperview(offset: -6)
    }
    
    private func setCardImage(url: String) {
        let url = URL(string: url)
        self.cardImage.kf.setImage(with: url)
    }

}
