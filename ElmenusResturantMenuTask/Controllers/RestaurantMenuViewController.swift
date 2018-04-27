//
//  MenuViewController.swift
//  ElmenusResturantMenuTask
//
//  Created by Salem Mohamed on 4/27/18.
//  Copyright © 2018 Salem Mohammed. All rights reserved.
//

import UIKit

protocol MenuView {
    
}

class RestaurantMenuViewController: UITableViewController {

    var viewModel : MenuViewModel!
    fileprivate let headerViewIdentifier = "MenuTableHeaderView"
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = RestaurantMenuViewModel(view: self)
        
        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.sectionHeaderHeight = 70
        tableView?.separatorStyle = .none
        
        tableView?.register(UINib(nibName: headerViewIdentifier, bundle: nil), forHeaderFooterViewReuseIdentifier: headerViewIdentifier)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
}

extension RestaurantMenuViewController: MenuView {
    
}
