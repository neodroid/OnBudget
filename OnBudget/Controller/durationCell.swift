//
//  durationCell.swift
//  OnBudget
//
//  Created by Jason Kenneth on 09/04/22.
//

import UIKit

protocol durationCellProtocol: AnyObject {
    func updateTableSelected(index: Int, dateSelected: String)
}

class durationCell: UITableViewCell {

    @IBOutlet weak var datePicker: UIDatePicker!
    
    weak var delegate: durationCellProtocol?
    var currentIndex = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func dateSelect(_ sender: Any) {
        
        let datestyle = DateFormatter()

        datestyle.timeZone = TimeZone(abbreviation: "GMT+7")
        datestyle.locale = NSLocale.current
        datestyle.dateFormat = "dd-MMM-yyyy"

        let date = datestyle.string(from: datePicker.date)
        
        self.delegate?.updateTableSelected(index: currentIndex, dateSelected: date)
        
    }
    
}
