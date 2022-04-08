//
//  ViewController.swift
//  OnBudget
//
//  Created by Kevin ahmad on 05/04/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var openingLabel: UILabel!
    @IBOutlet weak var mainBg: UIImageView!
    @IBOutlet weak var addTripBtn: UIButton!
    @IBOutlet weak var dashboardBg: UIImageView!
    
    public var currTripStatus : Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dashboardBg.isHidden = true
        
        // Check if currTripStatus true
        if currTripStatus{
            mainBg.isHidden = true
            addTripBtn.isHidden = true
            //changeBgColor()
            dashboardBg.isHidden = false
        }
    }

    func changeBgColor(){
        let gradient = CAGradientLayer()
        
        gradient.frame = mainView.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor(red: 0.83, green: 0.87, blue: 1.00, alpha: 1.00).cgColor]
        
        mainView.layer.insertSublayer(gradient, at: 0)
    }
    
    @IBAction func pressAddTrip(_ sender: Any) {
        print("added trip")
//        guard let vc = storyboard?.instantiateViewController(withIdentifier: "AddTrip") as? AddTripViewController else{
//            return
//        }
//        present(vc, animated: true)
    }
}

