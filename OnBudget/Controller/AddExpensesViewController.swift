//
//  AddExpensesViewController.swift
//  OnBudget
//
//  Created by Jason Kenneth on 11/04/22.
//

import UIKit

class AddExpensesViewController: UIViewController {

    // IBOutlet
    @IBOutlet weak var category: UIButton!
    @IBOutlet weak var titleExpense: UITextField!
    @IBOutlet weak var totalExpense: UITextField!
    @IBOutlet weak var dateExpense: UIDatePicker!
    
    var expensesBrain = ExpensesBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Add Expense"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(didTapClose))
        //category.titleLabel = pickCategory
    }
    
    @objc func didTapClose(){
        dismiss(animated: true)
    }

    @IBAction func selectCategory(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "category") as? CategoryViewController else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        
        let datestyle = DateFormatter()

        datestyle.timeZone = TimeZone(abbreviation: "GMT+7")
        datestyle.locale = NSLocale.current
        datestyle.dateFormat = "dd-MMM-yyyy"

        let date = datestyle.string(from: dateExpense.date)
        
        print(titleExpense.text!)
        let expenseNum = Double(totalExpense.text!)
        print(date)
        
        expensesBrain.addExpense(name: titleExpense.text!, category: date, value: expenseNum!)
        
        print(expensesBrain.expenses)
        
    }
    
}
