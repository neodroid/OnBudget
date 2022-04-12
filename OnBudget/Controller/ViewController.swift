//
//  ViewController.swift
//  OnBudget
//
//  Created by Kevin ahmad on 05/04/22.
//

import UIKit

class ViewController: UIViewController, AddTripViewControllerDelegate {
    func updateMainView() {
        print("called")
        
    }
    
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
        updateView()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(updateMain), name: Notification.Name("updateViewMain"), object: nil)
    }
    
    @objc func updateMain() {
        DispatchQueue.main.async {
            self.currTripStatus = true
            self.updateView()
        }
    }
    
    func updateView() {
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
//        self.performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let addVC = segue.destination as? AddTripViewController
            addVC?.delegate = self
        }
    }
    
    
    
}

