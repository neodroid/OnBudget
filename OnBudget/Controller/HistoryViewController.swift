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
            cell?.title.text = "\(selectedTrip.name!)"
            cell?.date.text = "(\(selectedTrip.dateStart!) to \(selectedTrip.dateEnd!))"
            cell?.destination.text = selectedTrip.destination
            cell?.expense.text = formatDoubleToString(double: selectedTrip.spent!)
            cell?.budget.text = "dari \(formatDoubleToString(double: selectedTrip.budget!))"
        }
        
        cell?.backgroundColor = .lightGray
        cell?.layer.cornerRadius = 20
        
        return cell!
    }
    
    func formatDoubleToString(double: Double) -> String{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.usesGroupingSeparator = true
        numberFormatter.groupingSeparator = "."
        numberFormatter.groupingSize = 3
        let myFormattedDouble = numberFormatter.string(for: double)
        
        return("Rp. \(myFormattedDouble!)")
    }
    
}
