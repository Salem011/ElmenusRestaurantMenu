//
//  Category.swift
//  ElmenusResturantMenuTask
//
//  Created by Salem Mohamed on 4/27/18.
//  Copyright © 2018 Salem Mohammed. All rights reserved.
//

import Foundation

class Category {
    
    var id: Int
    var name: String
    var items: [Item]
    var isCollapsed: Bool
    
    init(from mappedCategory: MappedMenuCategory) {
        self.id = mappedCategory.id ?? -1
        self.name = mappedCategory.name ?? "N/A"
        
        var categoryItems = [Item]()
        if let mappedItems = mappedCategory.items {
            for mappedItem in mappedItems {
                categoryItems.append(Item(from: mappedItem))
            }
        }
        self.items = categoryItems
        self.isCollapsed = false
    }
    
}
