//
//  CategoryViewController.swift
//  OnBudget
//
//  Created by Vincentius Sutanto on 12/04/22.
//

import UIKit

class CategoryViewController: UIViewController  {
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        return duration.count
//    }
    

    var duration = ["Starts on","Ends on"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        tableView.delegate = self
//        tableView.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(didTapAdd))
        navigationItem.largeTitleDisplayMode = .never
    }

    @objc func didTapAdd(){
    
        
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
