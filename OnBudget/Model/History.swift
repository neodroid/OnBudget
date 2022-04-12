//
//  History.swift
//  OnBudget
//
//  Created by Vincentius Sutanto on 10/04/22.
//

import Foundation

var tripData = History()

struct History {
    
    var currentTrip = [TripBrain(currTripStatus: true, name: "Test", destination: "TestDes", budget: 0, spent: 0, dateStart: "", dateEnd: "")]
    
    var expenses = [Expense(n: "dummy", c: "dummy", v: 0,d: "dummy")]
    
   var tripHistory =  [
            TripBrain(currTripStatus: false, name: "Jalan-jalan", destination: "Bali", budget: 2000000),
            TripBrain(currTripStatus: false, name: "Jalan-jalan", destination: "Bandung", budget: 2000000),
            //TripBrain(currTripStatus: true, name: "INI GILA", destination: "Bandung", budget: 2000000),
        ]
}

