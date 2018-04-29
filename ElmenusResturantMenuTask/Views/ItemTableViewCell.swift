//
//  ItemTableViewCell.swift
//  ElmenusResturantMenuTask
//
//  Created by Salem Mohamed on 4/27/18.
//  Copyright © 2018 Salem Mohammed. All rights reserved.
//

import UIKit

protocol ItemCellDelegate: class {
    func didPressLikeItem(itemCell: ItemTableViewCell, itemIndex: (section: Int, row: Int), isLiked: Bool)
}

class ItemTableViewCell: UITableViewCell {

    weak var delegate: ItemCellDelegate?
    
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    
    @IBOutlet weak var likeButton: UIButton!
    
    // Item to be presented
    var item: ItemViewModel! {
        didSet {
            itemTitleLabel.text = item.name
            itemDescriptionLabel.text = item.details
            likeButton.setTitle(item.isLiked ? "Unlike" : "Like" , for: .normal)
        }
    }
    
    // (Section, Index) - Used to identify the item's exact index to update it when the item is liked/unliked.
    var itemIndex: (Int, Int) = (0, 0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemTitleLabel.adjustsFontSizeToFitWidth = true
    }
    
    @IBAction func onClickLikeItem(_ sender: UIButton) {
        item.isLiked = !item.isLiked
        if item.isLiked {
            sender.setTitle("Unlike", for: .normal)
        }else {
            sender.setTitle("Like", for: .normal)
        }
        
        delegate?.didPressLikeItem(itemCell: self, itemIndex: itemIndex, isLiked: item.isLiked)
    }
    
}
