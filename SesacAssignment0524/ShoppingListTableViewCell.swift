//
//  ShoppingListTableViewCell.swift
//  SesacAssignment0524
//
//  Created by 하연주 on 5/25/24.
//

import UIKit

class ShoppingListTableViewCell: UITableViewCell {
    @IBOutlet var checkboxButton: UIButton!
    @IBOutlet var shoppingItemLabel: UILabel!
    @IBOutlet var starButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
