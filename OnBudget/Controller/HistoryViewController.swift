//
//  HistoryViewController.swift
//  OnBudget
//
//  Created by Vincentius Sutanto on 08/04/22.
//

import UIKit

class HistoryViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var historyCollectionView: UICollectionView!
    
    var historyList = History()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        historyCollectionView.dataSource = self
        historyCollectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        historyList.tripHistory.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = (collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCellID", for: indexPath) as? ItemCell)
        let trip = historyList.tripHistory[indexPath.row]
        
        cell?.title.text = "\(trip.name!) (\(trip.destination!))"
        cell?.destination.text = trip.destination
        cell?.expense.text = "Rp2.000.000"
        cell?.budget.text = "dari Rp\(trip.budget!)"
        
        cell?.backgroundColor = UIColor(red: 0.83, green: 0.87, blue: 1.00, alpha: 1.00)
        
        return cell!
    }
    
    
    
    
}
