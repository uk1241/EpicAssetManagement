//
//  TransferAssetTableViewCell.swift
//  EpicTransfer
//
//  Created by R.Unnikrishnan on 28/03/23.
//

import UIKit

class TransferAssetTableViewCell: UITableViewCell {
    @IBOutlet weak var addAssetButton: UIButton!
    @IBOutlet weak var assetLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func addAssetButtonAction(_ sender: Any)
    {
       
    }
    

}
