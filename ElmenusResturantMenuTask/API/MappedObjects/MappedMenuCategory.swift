//
//  MappedMenuCategory.swift
//  ElmenusResturantMenuTask
//
//  Created by Salem Mohamed on 4/27/18.
//  Copyright © 2018 Salem Mohammed. All rights reserved.
//

import Foundation
import ObjectMapper

class MappedMenuCategory: Mappable {
    
    // MARK: Identifiers
    fileprivate let categoryNameKey = "name"
    fileprivate let categoryItemsKey = "items"
    fileprivate let categoryIdKey = "id"
    fileprivate let categoryDescriptionKey = "description"
    
    
    // MARK: Properties
    var name: String?
    var items: [MappedMenuItem]?
    var id: Int?
    var categoryDescription: String?

    
    required public init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        name <- map[categoryNameKey]
        items <- map[categoryItemsKey]
        id <- map[categoryIdKey]
        categoryDescription <- map[categoryDescriptionKey]
    }
}
