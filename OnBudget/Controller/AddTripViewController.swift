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
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didTapCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(didTapAdd))
        
    }
    
    @objc func didTapCancel(){
        self.dismiss(animated: true, completion: nil)
    }
                                                            
    @objc func didTapAdd (){
        self.dismiss(animated: true, completion: nil)
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "dashboard") as? ViewController else{
            return
        }
        vc.currTripStatus = true
        print(vc.currTripStatus)
    }

}
