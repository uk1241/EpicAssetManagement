//
//  SelectEmployeeViewController.swift
//  EpicTransfer
//
//  Created by R.Unnikrishnan on 28/03/23.
//

import UIKit

class SelectEmployeeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Select Employee"
    }
    


}
extension SelectEmployeeViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SelectEmployeeTableViewCell", for: indexPath) as! SelectEmployeeTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                          let vc = storyBoard.instantiateViewController(withIdentifier: "TransferAssetViewController") as! TransferAssetViewController
                     self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}

@IBDesignable
class CustomView: UIView{

@IBInspectable var borderWidth: CGFloat = 0.0{

    didSet{

        self.layer.borderWidth = borderWidth
    }
}


@IBInspectable var borderColor: UIColor = UIColor.clear {

    didSet {

        self.layer.borderColor = borderColor.cgColor
    }
}

override func prepareForInterfaceBuilder() {

    super.prepareForInterfaceBuilder()
}

}
