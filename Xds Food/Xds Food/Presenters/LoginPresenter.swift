//
//  LoginPresenter.swift
//  Xds Food
//
//  Created by Zanette Ciriaco on 26/07/22.
//

import UIKit

protocol LoginProtocol: AnyObject {
    func loginResponse(res: LoginResponse)
    func goToNextScreen()
    func showAlert(title: String, message: String)
    func startLoading()
    func stopLoading()
}

class LoginPresenter {
    
    weak private var loginView: LoginProtocol?
    
    func attachView(_ view: LoginProtocol) {
        self.loginView = view
    }
    
    func login(user: String, password: String) {
        self.loginView?.startLoading()
        
        LoginService().login(user: user, password: password) { res, error in
            if !error {
                guard let response = res else { return }
                self.loginView?.stopLoading()
                self.loginView?.loginResponse(res: response)
            } else {
                self.loginView?.stopLoading()
                self.loginView?.showAlert(title: "Login inválido", message: "Email ou senha inválido")
            }
        }
    }
}
