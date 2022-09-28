//
//  FoodPresenter.swift
//  Xds Food
//
//  Created by Zanette Ciriaco on 26/07/22.
//

import Foundation

protocol FoodProtocol: AnyObject {
    func getFoods(response: [Food])
}

class FoodPresenter {
    weak private var FoodsView: FoodProtocol?
    
    func attachView(_ view: FoodProtocol) {
        self.FoodsView = view
    }
    
    func getFoods() {
        FoodService().getFoods { res, error in
            if !error {
                guard let response = res else { return }
                self.FoodsView?.getFoods(response: response)
            }
        }
    }
}


