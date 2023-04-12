//
//  AssetViewController.swift
//  EpicAssetTwo
//
//  Created by R Unnikrishnan on 10/03/23.
//

import UIKit

class AssetViewController: UIViewController {
    
    @IBOutlet weak var transferButton: UIButton!
    
    var isselected = [Int:Bool]()
    var selectedList = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = false
        
        for i in 0...isselected.count
        {
            if isselected[i] == true
            {
                selectedList.append(i)
            }
           
        }
        
    }
    
    @IBAction func transferButtonAction(_ sender: Any)
    {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "TransferSuccessViewController") as! TransferSuccessViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}

extension AssetViewController: UITableViewDelegate,UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AssetTableViewCell", for: indexPath) as! AssetTableViewCell
        cell.assetNameLabel?.text = laptopModels[selectedList[indexPath.row]]
        cell.addAssetButton.addTarget(self, action: #selector(addAssetButtonAction), for: .touchUpInside)
        //cell.AssetSelectButton.addTarget(self, action: #selector(selectButtonTapped), for: .touchUpInside)
        return cell
    }
    @objc func addAssetButtonAction()
    {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "AddAssetViewController") as! AddAssetViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
