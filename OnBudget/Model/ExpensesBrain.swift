//
//  ExpensesBrain.swift
//  OnBudget
//
//  Created by Kevin ahmad on 11/04/22.
//

import Foundation

struct ExpensesBrain {
    
    
    var expenses = [Expense(n:"test",c:"test",v:0),Expense(n:"test2",c:"test2",v:0),Expense(n:"test3",c:"test3",v:0)]
    
    mutating func addExpense(name:String, category:String, value: Double) {
        expenses.append(Expense(n:name,c:category,v: value))
    }
    
    
}

