//
//  RestaurantMenBaseResponse.swift
//  ElmenusResturantMenuTask
//
//  Created by Salem Mohamed on 4/27/18.
//  Copyright © 2018 Salem Mohammed. All rights reserved.
//

import Foundation
import ObjectMapper

class RestaurantMenBaseResponse: Mappable {

    // MARK: Identifiers
    fileprivate let categoriesKey = "categories"
    
    // MARK: Properties
    var categories: [MappedMenuCategory]?

    
    required public init?(map: Map){
        
    }
    
    public func mapping(map: Map) {
        categories <- map[categoriesKey]
    }
    
}
