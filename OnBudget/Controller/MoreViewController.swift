//
//  MoreViewController.swift
//  OnBudget
//
//  Created by Vincentius Sutanto on 13/04/22.
//

import UIKit

class MoreViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "More"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapClose))
    }
    
    @objc func didTapClose(){
        dismiss(animated: true)
    }
    
    @IBAction func selectExpense(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func editTrip(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func endTrip(_ sender: Any) {
        endAlert()
    }
    
    func endAlert(){
        
        let alert = UIAlertController(title: "End Trip", message: "Are you sure to End Trip?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: {action in
            print("tapped cancel")
        }))
        
        alert.addAction(UIAlertAction(title: "End Trip", style: .destructive, handler: {action in
            self.onClick()
        }))
        
        present(alert, animated: true)
    }
    
    func onClick(){
        dismiss(animated: true)
        tripData.currentTrip[0].currTripStatus = false
        isThereAnyTrip = false
    }
}
