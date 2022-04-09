//
//  AddTripViewController.swift
//  OnBudget
//
//  Created by Kevin ahmad on 07/04/22.
//

import UIKit

class AddTripViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    var tripBrain = TripBrain()
    var duration = ["Starts on","Ends on"]
    
    @IBOutlet weak var titleField: UITextField!
    
    @IBOutlet weak var destinationField: UITextField!
    
//    @IBOutlet weak var budgetField: UITextField!

    @IBOutlet weak var tableView: UITableView!
    
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
    
    @objc func didTapCancel(){
        self.dismiss(animated: true, completion: nil)
    }
                                                            
    @objc func didTapAdd (){
        self.dismiss(animated: true, completion: nil)
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "dashboard") as? ViewController else{
            return
        }
        vc.currTripStatus = true
        print(vc.currTripStatus)
        
        tripBrain.editName(tripName: titleField.text!)
        tripBrain.editDestination(tripDestination: destinationField.text!)
        
        
        print("trip name: \(tripBrain.name!)")
        print("trip destination: \(tripBrain.destination!)")
        
    }
    
}




