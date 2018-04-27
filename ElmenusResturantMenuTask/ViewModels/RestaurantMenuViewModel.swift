//
//  RestaurantMenuViewModel.swift
//  ElmenusResturantMenuTask
//
//  Created by Salem Mohamed on 4/27/18.
//  Copyright © 2018 Salem Mohammed. All rights reserved.
//

import Foundation

typealias CategoryViewModel = (id: Int, name: String)
typealias Item = (id: Int, name: String, details: String)

protocol MenuViewModel {
    func retrieveMenuCategories()
    
    func categoriesCount () -> Int
    func category(at index: Int) -> CategoryViewModel
    
    func itemsCountOfCategory(at index: Int) -> Int
    
}

class RestaurantMenuViewModel {
    
    var view: MenuView!
    
    var menuCategories: [Category]!
    
    
    init(view: MenuView) {
        self.view = view
        menuCategories = [Category]()
    }
    
}

extension RestaurantMenuViewModel: MenuViewModel {
   
    func retrieveMenuCategories() {
        APIManager.getMenuComponents { (mappedCategories, errorMessage) in
            guard let categories = mappedCategories else {
                self.view.didFailToLoadMenu(with: errorMessage ?? "The Restaurant Menu can't be loaded right now. Please Try again later.")
                return
            }
            
            var categoriesObjects = [Category]()
            for mappedCategory in categories {
                categoriesObjects.append(Category(from: mappedCategory))
            }
            self.menuCategories = categoriesObjects
            self.view.menuIsLoaded()
        }
    }
    
    func categoriesCount() -> Int {
        return menuCategories.count
    }
    
    func category(at index: Int) -> CategoryViewModel {
        let category = menuCategories[index]
        return CategoryViewModel(id: category.id, name: category.name )
    }
    
    func itemsCountOfCategory(at index: Int) -> Int {
        return menuCategories[index].items.count
    }

}
