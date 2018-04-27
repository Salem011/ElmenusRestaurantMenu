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
    var items: [MappedMenuItem]
    var isCollapsed: Bool
    
    init(from mappedCategory: MappedMenuCategory) {
        self.id = mappedCategory.id ?? -1
        self.name = mappedCategory.name ?? "N/A"
        self.items = mappedCategory.items ?? [MappedMenuItem]()
        self.isCollapsed = false
    }
    
}
