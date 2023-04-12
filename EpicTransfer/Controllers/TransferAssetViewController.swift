//
//  TransferAssetViewController.swift
//  EpicTransfer
//
//  Created by R.Unnikrishnan on 28/03/23.
//

import UIKit

class TransferAssetViewController: UIViewController {

    @IBOutlet weak var assetAddButton: UIButton!
    @IBOutlet weak var transferAssetButton: UIButton!
    
    @IBOutlet weak var maintainBtn: UIButton!
    
    
    @IBOutlet weak var addAssetButton: UIButton!
    
    var isselected = [Int:Bool]()
    var isselecte = [Int:Bool]()
    var selectedList = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()

        
        for i in 0...isselected.count
        {
            if isselected[i] == true
            {
                selectedList.append(i)
            }
           
        }
        
        
        navigationItem.title = "Transfer Assets"
    
    }
    @IBAction func maintainButtonAction(_ sender: Any)
    {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "AssetViewController") as! AssetViewController
        vc.isselectede = isselecte
        self.navigationController?.pushViewController(vc, animated: true)
    }

}

extension TransferAssetViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TransferAssetTableViewCell", for: indexPath) as! TransferAssetTableViewCell
        cell.assetLabel?.text = laptopModels[selectedList[indexPath.row]]
//        cell.addAssetButton.addTarget(self, action: #selector(addAssetButtonAction), for: .touchUpInside)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {

    }
    
}
