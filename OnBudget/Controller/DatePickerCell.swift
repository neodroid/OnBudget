//
//  DatePickerCell.swift
//  OnBudget
//
//  Created by Jason Kenneth on 09/04/22.
//

import UIKit

class DatePickerCell: UITableViewCell {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var duration = ["Starts on","Ends on"]
    
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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
