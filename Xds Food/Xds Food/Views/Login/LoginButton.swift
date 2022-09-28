//
//  LoginButton.swift
//  Xds Food
//
//  Created by Zanette Ciriaco on 26/07/22.
//

import UIKit

class LoginButton: UIButton {
    
    override open var isEnabled: Bool {
        didSet {
            self.title.isHidden = isEnabled ? false : true
            self.backgroundColor = isEnabled ? .customGreen : .lightGray
        }
    }
    
    let spinner: UIActivityIndicatorView = {
        let spinner = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        spinner.hidesWhenStopped = true
        spinner.color = .white
        return spinner
    }()
    
    let title: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        
        self.addSubview(title)
        self.addSubview(spinner)
        
        self.height(53.16)
        self.width(UIScreen.main.bounds.width - 112)
        
        self.backgroundColor = .customGreen
        self.layer.cornerRadius = 10
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        title.centerXToSuperview()
        title.centerYToSuperview()
        
        spinner.centerXToSuperview()
        spinner.centerYToSuperview()
    }
    
    func start() {
        self.isEnabled = false
        self.spinner.startAnimating()
    }
    
    func stop() {
        self.isEnabled = true
        self.spinner.stopAnimating()
    }
}
