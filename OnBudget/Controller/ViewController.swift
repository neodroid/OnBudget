//
//  ViewController.swift
//  OnBudget
//
//  Created by Kevin ahmad on 05/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var openingLabel: UILabel!
    @IBOutlet weak var mainBg: UIImageView!
    @IBOutlet weak var addTripBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func pressAddTrip(_ sender: Any) {
        print("added trip")
    }
}

