//
//  TransferAssetViewController.swift
//  EpicTransfer
//
//  Created by R.Unnikrishnan on 28/03/23.
//

import UIKit


let laptopModels = ["MacBook Air", "MacBook Pro", "Dell XPS 13", "HP Spectre x360","MacBook Air", "MacBook Pro", "Dell XPS 13", "HP Spectre x360","MacBook Air", "MacBook Pro", "Dell XPS 13", "HP Spectre x360"]
let laptopModels1 = [ "Dell XPS 13", "HP Spectre x360","MacBook Air", "MacBook Pro", "Dell XPS 13", "HP Spectre x360","MacBook Air", "MacBook Pro", "Dell XPS 13", "HP Spectre x360"]

class MyAssetViewController: UIViewController, UINavigationControllerDelegate {
    var select = false
    
    @IBOutlet weak var assetDropDownButton: UIButton!
    @IBOutlet var selectButton: [UIButton]!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var myAssetOutlet: UIButton!
    
    
    let dropDownTableView = UITableView()
    let transparentView = UIView()
    var isselecte = [Int:Bool]()
    var dropDownCount = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selected()
        configureItems()
        navigationController?.isNavigationBarHidden = false
        navigationController?.delegate = self
        dropDownTableView.delegate = self
        dropDownTableView.dataSource = self
        
    }
    
    
    
    @IBAction func dropDownAction(_ sender: UIButton)
    {
        showButtonVisibility()
        switch sender.currentTitle
        {
        case "All Assets":
            assetDropDownButton.setTitle("All Asset", for: .selected)
        case "My Assets":
            assetDropDownButton.setTitle("My Assset", for: .selected)
        default :
            break
        }
    }
    
    @IBAction func myAssetAction(_ sender: UIButton)
    {
        showButtonVisibility()
        tableView.reloadData()
      
    }
    
    @IBAction func MyAssetdropDownButtonAction(_ sender: UIButton)
    {
        
        
        if sender.isSelected && assetDropDownButton.isSelected
        {
            tableView.reloadData()
        }
        else
        {
            tableView.reloadData()
        }
        
    }
    
    //DROPDOWN FUNCTION
    func showButtonVisibility()
    {
        selectButton.forEach { button in
            button.isHidden = !button.isHidden
            self.view.layoutIfNeeded()
        }
    }
    //check and uncheck function
    private func selected()
    {
        let maxCount = max(laptopModels.count, laptopModels1.count)
        for i in 0..<maxCount {
            isselecte[i] = false
        }
    }

    //navbar configuration function
    private func configureItems()
    {
        
        let button = UIBarButtonItem(title: "Select", style: .plain, target: self, action: #selector(navbarButtonAction))
         // Set the title text attributes to white color
        button.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        // Set the UIBarButtonItem as the right bar button item
        navigationItem.rightBarButtonItem = button
        
    }
    
    //navigationBar Button Action
    @objc func navbarButtonAction(_ sender: UIBarButtonItem)
    {
        if select == false
        {
                sender.title = "Done"
                select = true
                tableView.reloadData()
        }
        else
        {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "TransferAssetViewController") as! TransferAssetViewController
            vc.isselected = isselecte
            self.navigationController?.pushViewController(vc, animated: true)
        }
        if isselecte.count == 0
        {
             select = false
            sender.title = "Select"
            tableView.reloadData()
        }
        
    
    }
}

//tableview functionalities
extension MyAssetViewController : UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        if myAssetOutlet.isSelected  && assetDropDownButton.isSelected
        {
            return laptopModels1.count
        }
        else
        {
            return laptopModels.count
        }
           
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyAssetTableViewCell", for: indexPath) as! MyAssetTableViewCell
        if select == false{
            cell.imageOutlet.isHidden = true
        }
        else
        {
            cell.imageOutlet.isHidden = false
        }
//-------------------------------------------------------
        if isselecte[indexPath.row] == true
        {
            cell.imageOutlet.image = UIImage(named: "check")
            cell.labelOutlet.text = laptopModels[indexPath.row]
        }
        else
        {
            cell.imageOutlet.image = UIImage(named: "untick")
            cell.labelOutlet.text = laptopModels[indexPath.row]
        }
//--------------------------------------------------------
        if myAssetOutlet.isSelected
        {
            if assetDropDownButton.isSelected
            {
                cell.imageOutlet.image = UIImage(named: "check")
                cell.labelOutlet.text = laptopModels1[indexPath.row]
            }
            else
            {
                cell.imageOutlet.image = UIImage(named: "untick")
                cell.labelOutlet.text = laptopModels1[indexPath.row]
            }
        }

        

        cell.selectionStyle = .none
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MyAssetTableViewCell
            cell.imageOutlet.image = UIImage(named: "check")
        
        
        if select == false
            
        {
          
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "ProductDetailViewController") as! ProductDetailViewController
            self.navigationController?.pushViewController(vc, animated: true)
            cell.imageOutlet.image = UIImage(named: "untick")
        }
        else
        {
            select = true
            isselecte[indexPath.row] = true

        }
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! MyAssetTableViewCell
        cell.imageOutlet.image = UIImage(named: "untick")
        if select == false
            
        {
          
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyBoard.instantiateViewController(withIdentifier: "ProductDetailViewController") as! ProductDetailViewController
            self.navigationController?.pushViewController(vc, animated: true)
            cell.imageOutlet.image = UIImage(named: "untick")
        }
        else
        {
            select = true
            isselecte[indexPath.row] = false
            cell.imageOutlet.image = UIImage(named: "untick")
        }
        
    }
    
    
    @objc func buttonAction()
    {
        print("you have tapped")
    }
    
    
}
