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
        navigationItem.largeTitleDisplayMode = .never
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
        
        if let nameTrip = tripData.currentTrip[0].destination {
            tripTitle.text = nameTrip
        }
        if let budgetTrip = tripData.currentTrip[0].budget {
            
            let remainingBudget = budgetTrip - tripData.currentTrip[0].spent!
            
            tripBudget.text = formatDoubleToString(double: remainingBudget)
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
    
    @IBAction func pressAddExpense(_ sender: Any) {
        let addExpenseVC =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddExpensesViewController")
        if let sheet = addExpenseVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 24
        }
        
        self.present(addExpenseVC, animated: true, completion: nil)
    }
    
    @IBAction func selectTrip(_ sender: Any) {
        
    }
    
    @IBAction func pressAddTrip(_ sender: Any) {
        print("added trip")
        print(tripData.currentTrip.count)
//        self.performSegue(withIdentifier: "toDetail", sender: self)
    }
    

    
    @IBAction func selectedTrip(_ sender: Any) {
        print("centsu ganteng")
        let vc = (storyboard?.instantiateViewController(withIdentifier: "current") as? CurrentTripViewController)!
        
        navigationController?.pushViewController(vc, animated: true)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetail" {
            let addVC = segue.destination as? AddTripViewController
            addVC?.delegate = self
        }
    }
    
    func formatDoubleToString(double: Double) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.groupingSeparator = "."
        numberFormatter.groupingSize = 3
        let myFormattedDouble = numberFormatter.string(for: double)
        
        return("Rp. \(myFormattedDouble!)")
    }
    
}

