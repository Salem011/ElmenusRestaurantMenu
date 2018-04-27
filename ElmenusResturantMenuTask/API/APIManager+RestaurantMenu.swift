//
//  APIManager+RestaurantMenu.swift
//  ElmenusResturantMenuTask
//
//  Created by Salem Mohamed on 4/27/18.
//  Copyright © 2018 Salem Mohammed. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

extension APIManager {
    
    class func getMenuComponents (completion : @escaping ([MappedMenuCategory]?, String?) -> Void) {
        
        Alamofire.request(baseURL + "menu", encoding: JSONEncoding.default, headers: headers).validate()
            .responseObject { (response: DataResponse<RestaurantMenBaseResponse>) in
                
               completion(response.result.value?.categories, response.result.error?.localizedDescription)
        }
    }
    
}
