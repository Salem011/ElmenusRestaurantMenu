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
    
    func reloadMenuTable(at section: Int, isExpanded: Bool)
}

class RestaurantMenuViewController: UITableViewController {

    var viewModel : MenuViewModel!
    fileprivate let headerViewIdentifier = "MenuTableHeaderView"
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = RestaurantMenuViewModel(view: self)
                
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.sectionHeaderHeight = 70
        
        tableView.register(UINib(nibName: headerViewIdentifier, bundle: nil), forHeaderFooterViewReuseIdentifier: headerViewIdentifier)
        tableView.tableFooterView = UIView()

        
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
        headerView.delegate = viewModel as? MenuHeaderDelegate
        headerView.index = section
        headerView.category = viewModel.category(at: section)
        return headerView
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.categoriesCount()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.itemsCountOfCategory(at: section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as! ItemTableViewCell
        let cellItem = viewModel.itemOfCategory(at: indexPath.section , itemIndex: indexPath.row)
       
        cell.delegate = viewModel as? ItemCellDelegate
        cell.item = cellItem
        cell.itemIndex = (indexPath.section, indexPath.row)
        return cell
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

    func reloadMenuTable(at section: Int, isExpanded: Bool) {
        tableView.beginUpdates()
        tableView.reloadSections([section], with: .fade)
        tableView.endUpdates()
        
        if !isExpanded {
            // Delay resetting the content insets of the table view to happed after the reload sections animation is done
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.tableView.contentInset.top = 0
            }
            return
        }
        
        // Move table view content insets to be at the expanded cell position
        let sectionRect = self.tableView.rectForHeader(inSection: section)
        self.tableView.contentInset.top = -sectionRect.origin.y
        
    }
}

