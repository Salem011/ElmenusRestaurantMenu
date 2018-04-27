//
//  RestaurantMenuViewModel.swift
//  ElmenusResturantMenuTask
//
//  Created by Salem Mohamed on 4/27/18.
//  Copyright © 2018 Salem Mohammed. All rights reserved.
//

import Foundation


protocol MenuViewModel {
    func getMenuCategories()
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
   
    func getMenuCategories() {
        APIManager.getMenuComponents { (mappedCategories, errorMessage) in
            guard let categories = mappedCategories else {
                self.view.didFailToLoadMenu(with: errorMessage ?? "The Restaurant Menu can't be loaded right now. Please Try again later.")
                return
            }
            self.menuCategories = categories
            self.view.menuIsLoaded()
        }
    }

}
