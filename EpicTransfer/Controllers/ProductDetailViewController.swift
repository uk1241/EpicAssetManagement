//
//  ProductDetailViewController.swift
//  EpicTransfer
//
//  Created by R.Unnikrishnan on 28/03/23.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
//    let images = ["event (1)", "product", "user (3)"]

    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var productPageControl: UIPageControl!
    
    @IBOutlet weak var transferButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
        navigationItem.title = "Product Details"
    

    }
    
    
    
    @IBAction func transferButtonAction(_ sender: Any)
    {
        
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyBoard.instantiateViewController(withIdentifier: "SelectEmployeeViewController") as! SelectEmployeeViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    func configureItems()
    {
        
        let button = UIBarButtonItem(title: "Add Photo", style: .plain, target: self, action: #selector(navbarButtonAction))
        // Set the title text attributes to white color
        button.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        // Set the UIBarButtonItem as the right bar button item
        navigationItem.rightBarButtonItem = button
        
    }
    @objc func navbarButtonAction(_ sender: UIBarButtonItem)
    {

//            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//                  let vc = storyBoard.instantiateViewController(withIdentifier: "AddAssetViewController") as! AddAssetViewController
//             self.navigationController?.pushViewController(vc, animated: true)
   
    }
    

   

}
//extension ProductDetailViewController : UIScrollViewDelegate
//{
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        productPageControl.currentPage = Int(productPageControl)
//    }
//}
