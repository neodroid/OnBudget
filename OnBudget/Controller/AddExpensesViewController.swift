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
    var selectedCategory : String = ""
    
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
        
        if checkInput(){
        
        let datestyle = DateFormatter()
        datestyle.timeZone = TimeZone(abbreviation: "GMT+7")
        datestyle.locale = NSLocale.current
        datestyle.dateFormat = "MMM dd, yyyy"
        let date = datestyle.string(from: dateExpense.date)

            let expenseNum = Double(totalExpense.text!)

            tripData.expenses.append(Expense(
                n: titleExpense.text!,
                c: selectedCategory,
                v: expenseNum!,
                d: date
            ))
            
            tripData.currentTrip[0].spent! += expenseNum!
        
            self.dismiss(animated: true) {
                NotificationCenter.default.post(name: NSNotification.Name("updateViewMain"), object: nil, userInfo: nil)
            }
        
        }
    }
    
    func checkInput() -> Bool {

        let input1Value = titleExpense.text
        let input2Value = "tes"
        let input3Value = totalExpense.text

        if !input1Value!.isEmpty && !input2Value.isEmpty && !input3Value!.isEmpty {

            if Double(input3Value!) != nil {
                if selectedCategory != "" {
                    return true
                }
                else{
                    showCatAlert()
                    return false
                }
                
            } else {
                showDoubleAlert()
                return false
            }
        }
        showAlert()
        return false
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Empty Input", message: "Fill all the input to continue", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {action in print("tapped dismiss")}))
        present(alert, animated: true)
        
    }
    func showDoubleAlert() {
        let alert = UIAlertController(title: "Total Expenses", message: "Total Expenses must be a number", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {action in print("tapped dismiss")}))
        present(alert, animated: true)
    }
    
    func showCatAlert(){
        let alert = UIAlertController(title: "No Category Selected", message: "Select a category to continue", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {action in print("tapped dismiss")}))
        present(alert, animated: true)
    }
    
    @IBAction func unwind( _ seg: UIStoryboardSegue) {
        if let vc = seg.source as? CategoryViewController {
            category.setTitle(vc.pickCategory, for: .normal)
            print(vc.pickCategory)
            selectedCategory = vc.pickCategory
        }
    }
    
    
}
