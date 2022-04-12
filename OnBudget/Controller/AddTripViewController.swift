//
//  AddTripViewController.swift
//  OnBudget
//
//  Created by Kevin ahmad on 07/04/22.
//

import UIKit



protocol AddTripViewControllerDelegate: AnyObject {
    func updateMainView()
}

class AddTripViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, durationCellProtocol{
    
    
   
    
    var expensesBrain = ExpensesBrain()
    var duration = ["Starts on","Ends on"]

    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var destinationField: UITextField!
    
    @IBOutlet weak var budgetField: UITextField!

    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: AddTripViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        
        titleField.autocapitalizationType = .words
        titleField.autocorrectionType = .no
        destinationField.autocapitalizationType = .words
        destinationField.autocorrectionType = .no
        
//        budgetField.autocapitalizationType = .words
//        budgetField.autocorrectionType = .no

        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(didTapCancel))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(didTapAdd))
        
    }
    

    override func viewWillDisappear(_ animated: Bool) {
        self.delegate?.updateMainView()
    }
    
    @objc func didTapCancel(){
        self.dismiss(animated: true, completion: nil)
//        print(cell.datePicker[0])
    }
                                                            
    @objc func didTapAdd (){

        
        if checkInput() {
            self.dismiss(animated: true) {
                NotificationCenter.default.post(name: NSNotification.Name("updateViewMain"), object: nil, userInfo: nil)
            }
            
            let budgets = Double(budgetField.text!)
            
            tripData.currentTrip[0].name = titleField.text!
            tripData.currentTrip[0].destination = destinationField.text!
            tripData.currentTrip[0].budget = budgets
            
            
            //delete dummy soalnya gabisa empty array hehe
            tripData.expenses.remove(at: 0)
        }

    }
    
    func checkInput() -> Bool {

//        let input1Value = titleField.text
//        let input2Value = destinationField.text
//        let input3Value = budgetField.text
//
//        if !input1Value!.isEmpty && !input2Value!.isEmpty && !input3Value!.isEmpty {
//
//            if Double(input3Value!) != nil {
//                return true
//            } else {
//                showDoubleAlert()
//                return false
//            }
//        }
//        showAlert()
//        return false
        return true
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "Empty Input", message: "Fill all the input to continue", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {action in print("tapped dismiss")}))
        present(alert, animated: true)
        
    }
    
    func showDoubleAlert() {
        let alert = UIAlertController(title: "Budget Error", message: "Budget must be a number", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {action in print("tapped dismiss")}))
        present(alert, animated: true)
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return duration.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "durationCell", for: indexPath) as? durationCell)!
        cell.textLabel?.text = duration[indexPath.row]
        cell.currentIndex = indexPath.row
        cell.delegate = self
        return cell
    }
    
    func updateTableSelected(index: Int, dateSelected: String) {
        if index == 0 {
            print("date start clicked at : \(dateSelected)")
            tripData.currentTrip[0].dateStart = dateSelected
            
        } else {
            print("date end clicked : \(dateSelected)")
            tripData.currentTrip[0].dateEnd = dateSelected
        }
    }
    
    
}




