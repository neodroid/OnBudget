//
//  CurrentTripViewController.swift
//  OnBudget
//
//  Created by Jason Kenneth on 11/04/22.
//

import UIKit

class CurrentTripViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    weak var delegate: durationCellProtocol?
    var currentIndex = 0
    
    @IBOutlet weak var destinationTxt: UILabel!
    @IBOutlet weak var totalTxt: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var remText: UILabel!
    @IBOutlet weak var remaining: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var calendar: UIDatePicker!
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("expense pressed")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return tripData.expenses.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "expenseCell", for: indexPath) as? DailyExpensesCell)!
//        cell.textLabel?.text = expenses[indexPath.row]
        cell.expenseName.text = tripData.expenses[indexPath.row].name
        cell.expenseAmount.text = formatDoubleToString(double: tripData.expenses[indexPath.row].value!)
        return cell
        
    }
    
    func showDestination(){
        destinationTxt.text = tripData.currentTrip[0].destination
    }
    
    func showTotalTxt() {
        
    }
    
    func showTotal(){
        
        
        let val = tripData.currentTrip[0].budget!
        total.text = formatDoubleToString(double: val)
        
    }
    
    func showRemTxt(){
        
    }
    
    func showRem(){
        
        let val = tripData.currentTrip[0].budget! - tripData.currentTrip[0].spent!
        
        remaining.text = formatDoubleToString(double: val)
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        

        let addButton   = UIBarButtonItem(image: UIImage(systemName: "plus"),  style: .plain, target: self, action: #selector(didTapAdd))
        let moreButton = UIBarButtonItem(image: UIImage(systemName: "ellipsis.circle"),  style: .plain, target: self, action: #selector(didTapMore))
        
        navigationItem.rightBarButtonItems = [moreButton, addButton]
        
        
        showDestination()
        showTotalTxt()
        showTotal()
        showRemTxt()
        showRem()
 
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
    

    @objc func didTapAdd(){
        let addExpenseVC =  UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddExpensesViewController")
        if let sheet = addExpenseVC.sheetPresentationController {
            sheet.detents = [.medium()]
            sheet.preferredCornerRadius = 24
        }
        
        self.present(addExpenseVC, animated: true, completion: nil)
    }
    
    @objc func didTapMore(){
        //d
    }
    
    @IBAction func dateSelect(_ sender: Any) {
        
        let datestyle = DateFormatter()

        datestyle.timeZone = TimeZone(abbreviation: "GMT+7")
        datestyle.locale = NSLocale.current
        datestyle.dateFormat = "MMM dd, yyyy"

        let date = datestyle.string(from: calendar.date)
        
        self.delegate?.updateTableSelected(index: currentIndex, dateSelected: date)
        
    }


}
