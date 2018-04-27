//
//  Item.swift
//  ElmenusResturantMenuTask
//
//  Created by Salem Mohamed on 4/27/18.
//  Copyright © 2018 Salem Mohammed. All rights reserved.
//

import Foundation
import ObjectMapper

class MappedMenuItem: Mappable {
    
    // MARK: Identifiers
    fileprivate let internalIdentifierKey = "id"
    fileprivate let descriptionValueKey = "description"
    fileprivate let nameValueKey = "name"
    
    
    // MARK: Properties
    var id: Int?
    var itemDescription: String?
    var name: String?
    
    
    required public init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map[internalIdentifierKey]
        itemDescription <- map[descriptionValueKey]
        name <- map[nameValueKey]
        
    }
}
