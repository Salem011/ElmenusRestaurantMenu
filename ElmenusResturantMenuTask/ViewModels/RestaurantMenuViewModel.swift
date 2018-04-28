//
//  RestaurantMenuViewModel.swift
//  ElmenusResturantMenuTask
//
//  Created by Salem Mohamed on 4/27/18.
//  Copyright © 2018 Salem Mohammed. All rights reserved.
//

import Foundation

// Category and Items view models that should be passed to the view. For similicity I created them as typealias but in general it should be view model classes.
typealias CategoryViewModel = (id: Int, name: String)
typealias Item = (id: Int, name: String, details: String)

// The Restaurant View model protocol that defines the functions the view should know about. 
protocol MenuViewModel {
    func retrieveMenuCategories()
    
    func categoriesCount () -> Int
    func category(at index: Int) -> CategoryViewModel
    
    func itemsCountOfCategory(at index: Int) -> Int
    func itemOfCategory(at index: Int, itemIndex: Int) -> Item
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
        let cateogry = menuCategories[index]
        // Return 0 when the section is collapsed and return the items count when the section is expanded to present the items cells
        return cateogry.isCollapsed ? cateogry.items.count : 0
    }
    
    func itemOfCategory(at index: Int, itemIndex: Int) -> Item {
        let item = menuCategories[index].items[itemIndex]
        return Item(id: item.id ?? -1, name: item.name ?? "N/A", details: item.itemDescription ?? "N/A")
    }
    

}

extension RestaurantMenuViewModel: MenuHeaderDelegate {
    
    func didTabOnHeader(on view: MenuTableHeaderView, at index: Int) {
        let tabbedCategory = menuCategories[index]
        tabbedCategory.isCollapsed = !tabbedCategory.isCollapsed
        
        // Send -1 when the section is collapsed to prevent the tableview from scrolling
        self.view.reloadMenuTable(at: tabbedCategory.isCollapsed ? index : -1)
    }
    
}
