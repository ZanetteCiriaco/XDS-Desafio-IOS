//
//  Food.swift
//  Xds Food
//
//  Created by Zanette Ciriaco on 26/07/22.
//

import Foundation

struct Food: Decodable {
    let id: String
    let name: String
    let imageUrl: String
    let rating: Int
    let priceP: Double
    let priceM: Double
    let priceG: Double
}
