//
//  LoginService.swift
//  Xds Food
//
//  Created by Zanette Ciriaco on 26/07/22.
//

import Foundation
import Alamofire

struct LoginService {
    
    func login(user: String, password: String, completion: @escaping(LoginResponse?, Bool) -> Void) {
        
        let params = ["email": user, "password": password]
        
        AF.request(signinUrl, method: .post, parameters: params, encoding: JSONEncoding.default){ $0.timeoutInterval = 5 }.responseDecodable(of: LoginResponse.self) {
            response in
            
            switch response.result {
                
            case .success(_):
                guard let data = response.data else { return }
                
                do {
                    let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                    debugPrint(loginResponse)
                    completion(loginResponse, false)
                } catch {
                    print("JSONDecoder error")
                }
                
            case .failure(_):
                completion(nil, true)
            }
        }
    }
}
