//
//  CategoryViewController.swift
//  OnBudget
//
//  Created by Vincentius Sutanto on 12/04/22.
//

import UIKit

var pickCategory: String = ""

class CategoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var cat = ["🍔 Foods & Drinks", "🚕 Transportation", "🏠 Hotel", "💳 Top up", "🎳 Activity ", "🔍 Others" ]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = "Category Transaction"
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didTapDone))
    }


    @objc func didTapDone(){

        if checkInput(){
            print(pickCategory)
            performSegue(withIdentifier: "unwindToCategory", sender: self)
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cat.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: "CategoryCellID", for: indexPath) as? CategoryCell)!
        cell.categoryLabel.text = cat[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let position = indexPath.row
        pickCategory = cat[position]
    }
    
    func checkInput() -> Bool {

//        let category = pickCategory
        if pickCategory == "" {
            showAlert()
            return false
        }
        return true
    }
    
    func showAlert() {
        let alert = UIAlertController(title: "No Category Selected", message: "Select a category to continue", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: {action in print("tapped dismiss")}))
        present(alert, animated: true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
