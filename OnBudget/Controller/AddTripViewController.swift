//
//  AddTripViewController.swift
//  OnBudget
//
//  Created by Kevin ahmad on 07/04/22.
//

import UIKit

class AddTripViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didTapBack))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: nil)
    }
    
    @objc func didTapBack(){
//        self.storyboard?.instantiateViewController(withIdentifier: "dashboard")
//        self.navigationController?.popToRootViewController(animated: true)
    }
    
}
