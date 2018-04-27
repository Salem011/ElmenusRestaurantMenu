//
//  MenuTableHeaderView.swift
//  ElmenusResturantMenuTask
//
//  Created by Salem Mohamed on 4/27/18.
//  Copyright © 2018 Salem Mohammed. All rights reserved.
//

import UIKit

protocol MenuHeaderDelegate: class {
    func didTabOnHeader (on view: MenuTableHeaderView, at index: Int)
}

class MenuTableHeaderView: UITableViewHeaderFooterView {

    @IBOutlet weak var headerTitleLabel: UILabel!
    
    weak var delegate: MenuHeaderDelegate?
    
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
        delegate?.didTabOnHeader(on: self, at: index)
    }

    
    
}
