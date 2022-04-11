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
//    var date: Date?
    
    init(n: String, c:String, v: Double) {
        name = n
        category = c
        value = v
    }
    
    //func to edit
    mutating func editName(expenseName: String) {
        self.name = expenseName
    }
    
    mutating func editCategory(categoryName: String) {
        self.category = categoryName
    }
    
    mutating func editValue(valueName: Double) {
        self.value = valueName
    }
    
//    mutating func editDate(dateName: Date) {
//        self.date = dateName
//    }
    
    
    //func to get value
    
}
