//
//  FoodService.swift
//  Xds Food
//
//  Created by Zanette Ciriaco on 26/07/22.
//

import Alamofire

struct FoodService {
    
    func getFoods(completion: @escaping([Food]?, Bool) -> Void) {
        
        AF.request(foodsUrl, method: .get, encoding: JSONEncoding.default).responseDecodable(of: [Food].self) {
            response in
            
            switch response.result {
                
            case .success(_):
                guard let data = response.data else { return }
                
                do {
                    let foodResponse = try JSONDecoder().decode([Food].self, from: data)
                    debugPrint(foodResponse)
                    completion(foodResponse, false)
                } catch {
                    print("JSONDecoder error")
                }
                
            case .failure(_):
                completion(nil, true)
            }
        }
    }
}
