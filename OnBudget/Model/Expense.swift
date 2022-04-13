//
//  Expense.swift
//  OnBudget
//
//  Created by Kevin ahmad on 10/04/22.
//

import Foundation

struct Expense {
    
    
    var name: String?
    var category: String?
    var value: Double?
    var date: String?
    
    init(n: String, c:String, v: Double, d: String) {
        name = n
        category = c
        value = v
        date = d
    }
    
    
}
