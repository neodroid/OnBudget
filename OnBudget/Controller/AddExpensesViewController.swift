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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Add Expense"
    }

    @IBAction func selectCategory(_ sender: Any) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "category") as? CategoryViewController else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
