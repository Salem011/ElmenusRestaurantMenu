//
//  Item.swift
//  ElmenusResturantMenuTask
//
//  Created by Salem Mohamed on 4/28/18.
//  Copyright © 2018 Salem Mohammed. All rights reserved.
//

import Foundation

class Item {
    
    var id: Int
    var name: String
    var details: String
    var isLiked: Bool
    
    init(from mappedItem: MappedMenuItem) {
        self.id = mappedItem.id ?? -1
        self.name = mappedItem.name ?? "N/A"
        self.details = mappedItem.itemDescription ?? "N/A"
        self.isLiked = false
    }
    
}
