//
//  MenuTableHeaderView.swift
//  ElmenusResturantMenuTask
//
//  Created by Salem Mohamed on 4/27/18.
//  Copyright © 2018 Salem Mohammed. All rights reserved.
//

import UIKit

class MenuTableHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var headerTitleLabel: UILabel!
    
    var index: Int = 0
    
    var category: Category? {
        didSet {
            headerTitleLabel.text = category?.name
        }
    }
    
    
    
}
