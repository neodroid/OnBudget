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
        
        if trip.currTripStatus == false {
            let selectedTrip = trip.self
            cell?.title.text = "\(selectedTrip.name!) (\(selectedTrip.destination!))"
            cell?.destination.text = selectedTrip.destination
            cell?.expense.text = "Rp2.000.000"
            cell?.budget.text = "dari Rp\(selectedTrip.budget!)"
        }
        
        cell?.backgroundColor = .lightGray
        
        return cell!
    }
    
    
    
    
}
