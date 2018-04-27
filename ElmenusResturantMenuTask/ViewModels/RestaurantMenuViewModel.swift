//
//  RestaurantMenuViewModel.swift
//  ElmenusResturantMenuTask
//
//  Created by Salem Mohamed on 4/27/18.
//  Copyright © 2018 Salem Mohammed. All rights reserved.
//

import Foundation


protocol MenuViewModel {
    
}

class RestaurantMenuViewModel: MenuViewModel {
    
    var view: MenuView!
    
    init(view: MenuView) {
        self.view = view
    }
    
}
