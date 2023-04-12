//
//  TableViewCell.swift
//  EpicAssetTwo
//
//  Created by R Unnikrishnan on 09/03/23.
//

import UIKit

class MyAssetTableViewCell: UITableViewCell {

    @IBOutlet weak var labelOutlet: UILabel!
    
    @IBOutlet weak var imageOutlet: UIImageView!
    
    @IBOutlet weak var selectButtonOutlet: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }

    @IBAction func selectButtonAction(_ sender: Any) {
        
//        
//            selectButtonOutlet.setImage(UIImage(named: "check" ), for: .selected)
        
    }
}
