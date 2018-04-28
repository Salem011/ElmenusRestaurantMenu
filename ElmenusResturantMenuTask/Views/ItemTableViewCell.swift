//
//  ItemTableViewCell.swift
//  ElmenusResturantMenuTask
//
//  Created by Salem Mohamed on 4/27/18.
//  Copyright © 2018 Salem Mohammed. All rights reserved.
//

import UIKit

protocol ItemCellDelegate: class {
    func didPressLikeItem(itemCell: ItemTableViewCell, item: ItemViewModel)
}

class ItemTableViewCell: UITableViewCell {

    weak var delegate: ItemCellDelegate?
    
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    
    var item: ItemViewModel! {
        didSet {
            itemTitleLabel.text = item.name
            itemDescriptionLabel.text = item.details
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    @IBAction func onClickLikeItem(_ sender: UIButton) {
        item.isLiked = !item.isLiked
        if item.isLiked {
            sender.setTitle("Unlike", for: .normal)
        }else {
            sender.setTitle("Like", for: .normal)
        }
        
        delegate?.didPressLikeItem(itemCell: self, item: item)
    }
    
}
