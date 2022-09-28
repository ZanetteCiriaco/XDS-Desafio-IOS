//
//  LoginViewController.swift
//  Xds Food
//
//  Created by Zanette Ciriaco on 26/07/22.
//

import UIKit
import TinyConstraints

class LoginViewController: UIViewController {
    
    private let loginPresenter = LoginPresenter()
    
    let logoImage: UIImageView = {
        let view = UIImageView(image: UIImage(named: "xdsLogo"))
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let loginContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundGray
        return view
    }()
    
    let enterLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.text = "Entrar"
        return label
    }()
    
    let userTextField: LoginTextField = {
        let textfield = LoginTextField()
        textfield.placeholder = "usuario"
        return textfield
    }()
    
    let passwordTextField: LoginTextField = {
        let textfield = LoginTextField()
        textfield.isSecureTextEntry = true
        textfield.placeholder = "senha"
        return textfield
    }()
    
    let loginButton: LoginButton = {
        let button = LoginButton()
        button.title.text = "Entrar"
        button.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        return button
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.loginPresenter.attachView(self)
        self.hideKeyboardWhenTappedAround()
        
        configureView()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    private func configureView() {
        view.addSubview(logoImage)
        view.addSubview(loginContainerView)
        
        loginContainerView.addSubview(enterLabel)
        loginContainerView.addSubview(userTextField)
        loginContainerView.addSubview(passwordTextField)
        loginContainerView.addSubview(loginButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        logoImage.topToSuperview(offset: 74)
        logoImage.leftToSuperview(offset: 39)
        logoImage.rightToSuperview(offset: -39)
        
        loginContainerView.topToBottom(of: logoImage, offset: 74)
        loginContainerView.leftToSuperview()
        loginContainerView.rightToSuperview()
        loginContainerView.bottomToSuperview()
        
        enterLabel.topToSuperview(offset: 24)
        enterLabel.leftToSuperview(offset: 22)
        
        userTextField.centerXToSuperview()
        userTextField.topToBottom(of: enterLabel, offset: 18)
        
        passwordTextField.centerXToSuperview()
        passwordTextField.topToBottom(of: userTextField, offset: 17)
        
        loginButton.centerXToSuperview()
        loginButton.topToBottom(of: passwordTextField, offset: 55)
    }
    
    @objc func loginButtonAction() {
        if userTextField.text != "" && passwordTextField.text != "" {
            loginPresenter.login(user: userTextField.text!, password: passwordTextField.text!)
            
        } else {
            showAlert(title: "Campos Vazios", message: "Por favor informe o email e a senha para realizar o login")
        }
    }
}

extension LoginViewController: LoginProtocol {
    
    func loginResponse(res: LoginResponse) {
        print(res.accessToken)
        goToNextScreen()
    }
    
    func goToNextScreen() {
        let loadVC = FoodsViewController()
        loadVC.modalPresentationStyle = .fullScreen
        self.present(loadVC, animated: true)
    }
    
    func showAlert(title: String, message: String){
        let dialogMessage = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "Confirmar", style: .default, handler: nil)
        dialogMessage.addAction(confirm)
        self.present(dialogMessage, animated: true)
    }
    
    func startLoading() {
        loginButton.start()
    }
    
    func stopLoading() {
        loginButton.stop()
    }
    
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
