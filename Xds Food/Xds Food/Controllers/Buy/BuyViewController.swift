//
//  BuyViewController.swift
//  Xds Food
//
//  Created by Zanette Ciriaco on 27/07/22.
//

import UIKit

class BuyViewController: UIViewController {
    
    let buySuccessLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "Compra efetuada com sucesso!"
        label.width(186)
        label.textAlignment = .center
        return label
    }()
    
    let icon: UIImageView = {
        let image = UIImageView(image: UIImage(named: "buySuccesIcon"))
        image.height(186)
        image.width(186)
        return image
    }()
    
    let backButton: LoginButton = {
        let button = LoginButton()
        button.title.text = "Voltar"
        button.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    private func configureView() {
        view.backgroundColor = .black
        
        view.addSubview(icon)
        view.addSubview(buySuccessLabel)
        view.addSubview(backButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        icon.centerXToSuperview()
        icon.centerYToSuperview()
        
        buySuccessLabel.bottomToTop(of: icon, offset: -59)
        buySuccessLabel.centerXToSuperview()
        
        backButton.topToBottom(of: icon, offset: 50)
        backButton.centerXToSuperview()
    }
    
    @objc func backAction() {
        self.dismiss(animated: true)
    }

}
