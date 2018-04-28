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
typealias ItemViewModel = (id: Int, name: String, details: String, isLiked: Bool)

// The Restaurant View model protocol that defines the functions the view should know about. 
protocol MenuViewModel {
    func retrieveMenuCategories()
    
    func categoriesCount () -> Int
    func category(at index: Int) -> CategoryViewModel
    
    func itemsCountOfCategory(at index: Int) -> Int
    func itemOfCategory(at index: Int, itemIndex: Int) -> ItemViewModel
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
        return cateogry.isExpanded ? cateogry.items.count : 0
    }
    
    func itemOfCategory(at index: Int, itemIndex: Int) -> ItemViewModel {
        let item = menuCategories[index].items[itemIndex]
        return ItemViewModel(id: item.id, name: item.name, details: item.details, isLiked: item.isLiked)
    }
    

}

extension RestaurantMenuViewModel: MenuHeaderDelegate {
    
    func didTabOnHeader(on view: MenuTableHeaderView, at index: Int) {
        let tabbedCategory = menuCategories[index]
        tabbedCategory.isExpanded = !tabbedCategory.isExpanded
        
        self.view.reloadMenuTable(at: index, isExpanded: tabbedCategory.isExpanded)
    }
    
}


extension RestaurantMenuViewModel: ItemCellDelegate {
    
    func didPressLikeItem(itemCell: ItemTableViewCell, itemIndex: (section: Int, row: Int), isLiked: Bool) {
        let item = menuCategories[itemIndex.section].items[itemIndex.row]
        item.isLiked = isLiked
    }
}
