//
//  ViewController.swift
//  EpicAssetManagement
//
//  Created by USER on 02/03/23.
//

import UIKit
import MobileCoreServices
//import ImageActionSheet

class ViewController: UIViewController {
    
    var galleryImage = [UIImage]()

    @IBOutlet weak var customView: UIView!
    
    
    @IBOutlet weak var addImageButtonOutlet: UIButton!
    
    @IBOutlet weak var yourCommentTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Image"
        customView.clipsToBounds = true
        customView.layer.cornerRadius = 30
        customView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]

        let backButtonImage = UIImage(named: "arrow.backward")
        navigationController?.navigationBar.backIndicatorImage = backButtonImage
        
        
        yourCommentTextField.layer.cornerRadius = 24
        yourCommentTextField.clipsToBounds = true
        

    }

    @IBAction func addImageAction(_ sender: Any) {
        actionSheet()
    }
    
    
    func actionSheet()
      {
          let alert =  UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

          alert.addAction(UIAlertAction(title: "Take Photo", style: .default,handler: {
              (handler) in self.openCamera()
          }))

          alert.addAction(UIAlertAction(title: "Gallery", style: .default,handler: {
              (handler) in self.openGallery()
          }))
          alert.addAction(UIAlertAction(title: "", style: .default,handler: {
              (handler) in
          }))
          alert.addAction(UIAlertAction(title: "Cancel", style: .default,handler: {
              (handler) in
          }))
          self.present(alert, animated: true,completion: nil)
          
//          let actionSheet = ImageActionSheet(title: "Upload a file", message: "Please choose a file.")
//          actionSheet.add(action: AlertAction(title: "Camera", icon: UIImage(named: "camera"), action: {
//              print("Camera clicked")
//          }))
//          actionSheet.add(action: AlertAction(title: "Gallery", icon: UIImage(named: "gallery"), action: {
//              print("Gallery clicked")
//          }))
//
//          actionSheet.add(action: AlertAction(title: "Document", icon: UIImage(named: "file"), action: {
//              print("Document clicked")
//          }))
//          self.present(actionSheet, animated: true,completion: nil)
////          actionSheet.show(in: ViewController)
        
      }

    
    
    func openCamera()
    {
        if UIImagePickerController.isSourceTypeAvailable(.camera)
        {
            let image = UIImagePickerController()
            image.allowsEditing = true
            image.sourceType = .camera
            image.mediaTypes = [kUTTypeImage as String]
            self.present(image, animated: true,completion: nil)
        }
        
        
    }
    
    func openGallery()
    {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)
        {
            let image = UIImagePickerController()
            image.allowsEditing = true
            image.delegate = self
            self.present(image, animated: true,completion: nil)
        }
    }
    
}


extension ViewController : UIImagePickerControllerDelegate,UINavigationControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(info)
        
        if let editingimage = info[UIImagePickerController.InfoKey(rawValue: convertInfoKey(UIImagePickerController.InfoKey.editedImage))] as? UIImage
        {
            print(editingimage)
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                  let jumpToPage = storyBoard.instantiateViewController(withIdentifier: "ImageViewController") as! ImageViewController
            self.galleryImage.append(editingimage) // Add new element to the array
            jumpToPage.galleryImages = galleryImage
             self.navigationController?.pushViewController(jumpToPage, animated: true)
            
            
        }
        
        picker.dismiss(animated: true,completion: nil)
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true,completion: nil)
    }
    
    func covertFromUIimageTODict( _ input : [UIImagePickerController.InfoKey : Any]) -> [String : Any]{
        return Dictionary(uniqueKeysWithValues: input.map({key , value in (key.rawValue, value)}))
    }
    
    func convertInfoKey(_ input : UIImagePickerController.InfoKey) -> String{
        return input.rawValue
    }
}
