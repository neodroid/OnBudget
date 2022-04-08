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
    
    public var currTripStatus : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Check if currTripStatus true
        if currTripStatus{
            mainBg.isHidden = true
            
        }
    }


    @IBAction func pressAddTrip(_ sender: Any) {
        print("added trip")
//        guard let vc = storyboard?.instantiateViewController(withIdentifier: "AddTrip") as? AddTripViewController else{
//            return
//        }
//        present(vc, animated: true)
    }
}

