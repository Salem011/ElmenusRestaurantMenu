//
//  RestaurantMenuViewModel.swift
//  ElmenusResturantMenuTask
//
//  Created by Salem Mohamed on 4/27/18.
//  Copyright © 2018 Salem Mohammed. All rights reserved.
//

import Foundation


typealias Category = (id: Int, name: String)
typealias Item = (id: Int, name: String, details: String)

protocol MenuViewModel {
    func retrieveMenuCategories()
    
    func categoriesCount () -> Int
    func category(at index: Int) -> Category
    
    func itemsCountOfCategory(at index: Int) -> Int
    
}

class RestaurantMenuViewModel {
    
    var view: MenuView!
    
    var menuCategories: [MappedMenuCategory]!
    
    
    init(view: MenuView) {
        self.view = view
        menuCategories = [MappedMenuCategory]()
    }
    
}

extension RestaurantMenuViewModel: MenuViewModel {
   
    func retrieveMenuCategories() {
        APIManager.getMenuComponents { (mappedCategories, errorMessage) in
            guard let categories = mappedCategories else {
                self.view.didFailToLoadMenu(with: errorMessage ?? "The Restaurant Menu can't be loaded right now. Please Try again later.")
                return
            }
            self.menuCategories = categories
            self.view.menuIsLoaded()
        }
    }
    
    func categoriesCount() -> Int {
        return menuCategories.count
    }
    
    func category(at index: Int) -> Category {
        let mappedCategory = menuCategories[index]
        return Category(id: mappedCategory.id ?? -1, name: mappedCategory.name ?? "N/A")
    }
    
    func itemsCountOfCategory(at index: Int) -> Int {
        guard let items = menuCategories[index].items else {
            return 0
        }
        return items.count
    }

}
