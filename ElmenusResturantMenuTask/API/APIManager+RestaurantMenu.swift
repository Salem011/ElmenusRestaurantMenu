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
    
    class func getMenuComponents () {
        
        Alamofire.request(baseURL + "menu", encoding: JSONEncoding.default).validate()
            .responseObject { (response: DataResponse<RestaurantMenBaseResponse>) in
                
                print(response.error)
                print(response.result.value?.categories)
                
        }
    }
    
}
