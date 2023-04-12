//
//  AssetTableViewCell.swift
//  EpicAssetTwo
//
//  Created by R Unnikrishnan on 10/03/23.
//

import UIKit

class AssetTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var assetNameLabel: UILabel!
    
    @IBOutlet weak var addAssetButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
