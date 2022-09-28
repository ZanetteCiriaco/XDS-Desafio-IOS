//
//  LoginTextField.swift
//  Xds Food
//
//  Created by Zanette Ciriaco on 26/07/22.
//

import UIKit

class LoginTextField: UITextField {
    
    let paddingView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 12,height: 50))
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        
        self.height(50)
        self.width(UIScreen.main.bounds.width - 40)
        
        self.layer.cornerRadius = 8
        self.backgroundColor = .white
        self.leftView = paddingView
        self.rightView = paddingView
        self.leftViewMode = .always
        self.rightViewMode = .always
    }
}
