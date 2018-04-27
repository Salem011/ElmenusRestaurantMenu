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
    
    var category: CategoryViewModel? {
        didSet {
            headerTitleLabel.text = category?.name
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapOnHeader)))
    }
    
    @objc fileprivate func didTapOnHeader() {
    }

    
    
}
