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
    @IBOutlet weak var budgetProgress: UIProgressView!
    
    public var currTripStatus : Bool = false
    
    //dashboardTableView
    let categoryDash = ["🍔 Foods & Drinks", "🚕 Transportation", "🏠 Hotel", "💳 Top up", "🎳 Activity ", "🔍 Others" ]
    let sumPrice = [0,0,0,0,0,0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.largeTitleDisplayMode = .never
        currentTripDashboard.layer.shadowColor = UIColor.lightGray.cgColor
        currentTripDashboard.layer.shadowOpacity = 1
        currentTripDashboard.layer.shadowOffset = .zero
        currentTripDashboard.layer.shadowRadius = 10
        dashboardBg.isHidden = true
        currentTripDashboard.isHidden = true
        addExpensesBtn.isHidden = true
        dashboardTableView.isHidden = true
        updateView()
        dashboardTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(updateMain), name: Notification.Name("updateViewMain"), object: nil)
        
    }
    
    @objc func updateMain() {
        self.currTripStatus = true
        isThereAnyTrip = true
        DispatchQueue.main.async {
            self.updateView()
        }
    }
    
    func updateView() {

        if let destinationTrip = tripData.currentTrip[0].destination{
            tripTitle.text = "\(destinationTrip)"
        }
        if let budgetTrip = tripData.currentTrip[0].budget {
            
            let remainingBudget = budgetTrip - tripData.currentTrip[0].spent!
            
            tripBudget.text = formatDoubleToString(double: remainingBudget)
        }
        if let dateTrip = tripData.currentTrip[0].dateStart {
            tripDate.text = "from \(dateTrip) to \(tripData.currentTrip[0].dateEnd!)"
        }
    
        if isThereAnyTrip{
            mainBg.isHidden = true
            addTripBtn.isHidden = true
            //changeBgColor()
            dashboardBg.isHidden = false
            currentTripDashboard.isHidden = false
            addExpensesBtn.isHidden = false
            dashboardTableView.isHidden = false
            
            let progress = tripData.currentTrip[0].spent!/tripData.currentTrip[0].budget!
            budgetProgress.setProgress(Float(progress), animated: true)
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
    
    @IBAction func pressAddTrip(_ sender: Any) {
        print("added trip")
        print(tripData.currentTrip.count)
//        self.performSegue(withIdentifier: "toDetail", sender: self)
    }
    
    @IBAction func selectedTrip(_ sender: Any) {
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

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryDash.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: nil)
        cell.textLabel?.text = categoryDash[indexPath.row]
        cell.detailTextLabel?.text = "Rp\(sumPrice[indexPath.row])"
        return cell
    
    }
}
