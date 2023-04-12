//
//  TransferSuccessViewController.swift
//  EpicTransfer
//
//  Created by R.Unnikrishnan on 28/03/23.
//

import UIKit

class TransferSuccessViewController: UIViewController {
    
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        startTimer()
       
    }
    
    func startTimer()
    {
        timer = Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [weak self] timer in
            // This closure will be executed after 5 seconds
        self?.navigationController?.popToRootViewController(animated: true)
        self?.navigationController?.isNavigationBarHidden = false
           
        }
    }
    
  
       
       override func viewWillDisappear(_ animated: Bool) {
           super.viewWillDisappear(animated)
           // Invalidate the timer when the view controller disappears
           timer?.invalidate()
       }
   

}
