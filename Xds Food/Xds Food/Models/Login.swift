//
//  Login.swift
//  Xds Food
//
//  Created by Zanette Ciriaco on 26/07/22.
//

import Foundation


struct Login: Encodable {
    let user: String
    let password: String
}

struct LoginResponse: Decodable {
    let accessToken: String
    let tokenType: String
}
