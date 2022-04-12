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
    
    @IBOutlet weak var tripDate: UILabel!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var openingLabel: UILabel!
    @IBOutlet weak var mainBg: UIImageView!
    @IBOutlet weak var addTripBtn: UIButton!
    @IBOutlet weak var dashboardBg: UIImageView!
    @IBOutlet weak var currentTripDashboard: UIView!
    @IBOutlet weak var addExpensesBtn: UIButton!
    
    @IBOutlet weak var tripBudget: UILabel!
    @IBOutlet weak var tripTitle: UILabel!
    @IBOutlet weak var dashboardTableView: UITableView!
    
    public var currTripStatus : Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        dashboardBg.isHidden = true
        currentTripDashboard.isHidden = true
        addExpensesBtn.isHidden = true
        dashboardTableView.isHidden = true
        updateView()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(updateMain), name: Notification.Name("updateViewMain"), object: nil)
    }
    
    @objc func updateMain() {
        self.currTripStatus = true
        DispatchQueue.main.async {
            self.updateView()
        }
    }
    
    func updateView() {
        // Check if currTripStatus true
        
        if let nameTrip = tripData.currentTrip[0].name {
            tripTitle.text = nameTrip
        }
        if let budgetTrip = tripData.currentTrip[0].budget {
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.usesGroupingSeparator = true
            numberFormatter.groupingSeparator = ","
            numberFormatter.groupingSize = 3
            let myFormattedDouble = numberFormatter.string(for: budgetTrip)
            
            tripBudget.text = "Rp. \(myFormattedDouble!)"
        }
        if let dateTrip = tripData.currentTrip[0].dateStart {
            tripDate.text = "\(dateTrip) to \(tripData.currentTrip[0].dateEnd!)"
        }
    
        if currTripStatus{
            mainBg.isHidden = true
            addTripBtn.isHidden = true
            //changeBgColor()
            dashboardBg.isHidden = false
            currentTripDashboard.isHidden = false
            addExpensesBtn.isHidden = false
            dashboardTableView.isHidden = false
            
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
        print(tripData.currentTrip.count)
//        self.performSegue(withIdentifier: "toDetail", sender: self)
    }
    
//    @IBAction func pressAddExpense(_ sender: Any) {
//        
//    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let addVC = segue.destination as? AddTripViewController
            addVC?.delegate = self
        }
    }
    
    
    
}

