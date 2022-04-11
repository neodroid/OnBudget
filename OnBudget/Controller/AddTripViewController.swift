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

class AddTripViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var tripBrain = TripBrain()
    var expensesBrain = ExpensesBrain()
    var duration = ["Starts on","Ends on"]

    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var destinationField: UITextField!
    
//    @IBOutlet weak var budgetField: UITextField!

    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: AddTripViewControllerDelegate?

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("duration pressed")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return duration.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "durationCell", for: indexPath)
        cell.textLabel?.text = duration[indexPath.row]
        return cell
    }

    
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
    
    @IBAction func pressAdd(_ sender: Any) {
        self.dismiss(animated: true) {
            self.delegate?.updateMainView()
        }
        tripBrain.editName(tripName: titleField.text!)
        tripBrain.editDestination(tripDestination: destinationField.text!)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.delegate?.updateMainView()
    }
    
    @objc func didTapCancel(){
        self.dismiss(animated: true, completion: nil)
        
        print(expensesBrain.expenses[1].name!)
    }
                                                            
    @objc func didTapAdd (){
        
        self.dismiss(animated: true) {
            NotificationCenter.default.post(name: NSNotification.Name("updateViewMain"), object: nil, userInfo: nil)
        }
    }
    
}




