//
//  MenuViewController.swift
//  ElmenusResturantMenuTask
//
//  Created by Salem Mohamed on 4/27/18.
//  Copyright © 2018 Salem Mohammed. All rights reserved.
//

import UIKit
import PKHUD


protocol MenuView {
    func menuIsLoaded ()
    func didFailToLoadMenu(with message: String)
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
        
        HUD.show(.progress, onView: self.view)
        viewModel.retrieveMenuCategories()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerViewIdentifier) as? MenuTableHeaderView else {
             return UIView()
        }
        
        headerView.index = section
        headerView.category = viewModel.category(at: section)
        return headerView
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.categoriesCount()
    }
    
}

extension RestaurantMenuViewController: MenuView {
    
    func menuIsLoaded() {
        HUD.flash(.success)
        tableView.reloadData()
    }
    
    func didFailToLoadMenu(with message: String) {
        HUD.flash(.error)
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
