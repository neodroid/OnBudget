//
//  TripBrain.swift
//  OnBudget
//
//  Created by Kevin ahmad on 09/04/22.
//

import Foundation

struct TripBrain{
    
    var currTripStatus : Bool = false
    var name: String?
    var destination: String?
    var budget: Double?
    
//    var dateStart: Date?
//    var dateEnd: Date?
    
    // function to edit the value
    mutating func editName(tripName: String) {
        self.name = tripName
//        print(self.name!)
    }
    mutating func editDestination(tripDestination: String) {
        self.destination = tripDestination
//        print(self.destination!)
    }
    mutating func editStatus(tripStatus: Bool) {
        self.currTripStatus = tripStatus
//        print(self.destination!)
    }
    
    mutating func editBudget(tripBudget: Double) {
        self.budget = tripBudget
    }
    
    
    
    //function for getting the value
    func getStatus() -> Bool {
        return currTripStatus
    }
    
    
}
