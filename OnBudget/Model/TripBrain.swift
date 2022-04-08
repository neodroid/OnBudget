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
    func getStatus() -> Bool {
        return currTripStatus
    }
    
}
