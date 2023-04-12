//
//  ImageViewController.swift
//  EpicAssetManagement
//
//  Created by USER on 02/03/23.
//

import UIKit
import MobileCoreServices

class ImageViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var addImageButton: UIButton!
    var galleryImages = [UIImage]()
    
    
    @IBOutlet weak var CustomView: UIView!
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
//        title = "Add Image"
        configureItems()
        
        CustomView.clipsToBounds = true
        CustomView.layer.cornerRadius = 30
        CustomView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        
        
    }
    
    private func configureItems()
    {

            let addButton = UIBarButtonItem(
            title: "add Photo",
            image: UIImage(named: "plus"),
            target: self,
            action: #selector(navBarButtonAction)
            
            )
            
            let button = UIBarButtonItem(image: UIImage(named: "plus"),
                                         style:.plain,
                                         target: self,
                                         action: nil
                                        )
            


        
        // Set the title text attributes to white color
        addButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
       


        // Set the UIBarButtonItem as the right bar button item
        navigationItem.rightBarButtonItem = addButton

    }
   
    
    
    @IBAction func addImageButtonAction(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func navBarButtonAction()
    {
//        let vc = ViewController()
//        vc.galleryImage = self.galleryImages
        navigationController?.popToRootViewController(animated: true)
        
        
    }

   

}
extension ImageViewController : UICollectionViewDelegate, UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryImages.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell

        cell.imageViewOutlet.image = galleryImages[indexPath.row]
        return cell
        
    
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true,completion: nil)
    }

    
    
}
