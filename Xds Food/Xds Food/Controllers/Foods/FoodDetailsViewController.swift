//
//  FoodDetailsViewController.swift
//  Xds Food
//
//  Created by Zanette Ciriaco on 27/07/22.
//

import UIKit
import Kingfisher

class FoodDetailsViewController: UIViewController {
    
    var food: Food!
    var selectedPrice: Double!
    
    let foodImage: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let infoContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundGray
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 0
        return label
    }()
    
    let ratingView: FoodRatingView = {
        let view = FoodRatingView()
        return view
    }()
    
    let chooseSizeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Escolha o tamanho"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    
    lazy var sizesButton: FoodSizesContainerView = {
        let view = FoodSizesContainerView()
        view.delegate = self
        return view
    }()
    
    let buyButton: FoodBuyButton = {
        let button = FoodBuyButton()
        button.title.text = "Comprar"
        button.addTarget(self, action: #selector(buyAction), for: .touchUpInside)
        return button
    }()
    
    init(food: Food){
        self.food = food
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        selectedPrice = 0
        setFoodInfo()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    

    private func configureView() {
        view.addSubview(foodImage)
        view.addSubview(infoContainerView)
        infoContainerView.addSubview(nameLabel)
        infoContainerView.addSubview(ratingView)
        infoContainerView.addSubview(chooseSizeLabel)
        infoContainerView.addSubview(sizesButton)
        infoContainerView.addSubview(priceLabel)
        infoContainerView.addSubview(buyButton)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(backAction))
        swipeDown.direction = .down
        
        self.view.addGestureRecognizer(swipeDown)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        infoContainerView.bottomToSuperview()
        infoContainerView.leftToSuperview()
        infoContainerView.rightToSuperview()
        
        nameLabel.topToSuperview(offset: 20)
        nameLabel.leftToSuperview(offset: 20)
        
        ratingView.topToBottom(of: nameLabel, offset: 7)
        ratingView.left(to: nameLabel)
        
        chooseSizeLabel.topToBottom(of: ratingView, offset: 20)
        chooseSizeLabel.left(to: nameLabel)
        
        sizesButton.topToBottom(of: chooseSizeLabel, offset: 7)
        sizesButton.leftToSuperview(offset: 20)
        sizesButton.rightToSuperview(offset: -20)
        
        priceLabel.topToBottom(of: sizesButton, offset: 29)
        priceLabel.centerXToSuperview()
        
        buyButton.topToBottom(of: priceLabel, offset: 28)
        buyButton.leftToSuperview()
        buyButton.rightToSuperview()
        buyButton.bottomToSuperview()
        
        
        foodImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        foodImage.leadingToSuperview()
        foodImage.rightToSuperview()
        foodImage.bottomToTop(of: infoContainerView)
    }
    
    private func setFoodInfo() {
        nameLabel.text = food.name
        ratingView.setRating(value: food.rating)
        sizesButton.addPricesToButtons(p: food.priceP, m: food.priceM, g: food.priceG)
        priceLabel.RealNumberFormatter(value: sizesButton.priceToShow)
        foodImage.kf.setImage(with: URL(string: food.imageUrl))
    }
    
    @objc func buyAction() {
        if selectedPrice != 0 {
            let loadVc = BuyViewController()
            loadVc.modalPresentationStyle = .fullScreen
            self.present(loadVc, animated: true)
            
        } else {
            showAlert(title: "Escolha um Tamanho", message: "Por favor selecione um tamanho para prosseguir com a compra")
        }
    }
    
    @objc func backAction() {
        self.dismiss(animated: true)
    }
    
    private func showAlert(title: String, message: String){
        let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "Confirmar", style: .default, handler: nil)
        dialogMessage.addAction(confirm)
        self.present(dialogMessage, animated: true)
    }

}

extension FoodDetailsViewController: FoodSizesContainerViewProtocol {
    func changePriceToShow(price: Double) {
        priceLabel.RealNumberFormatter(value: price)
        selectedPrice = price
    }
}
