//
//  ExpensesBrain.swift
//  OnBudget
//
//  Created by Kevin ahmad on 11/04/22.
//

import Foundation

struct ExpensesBrain {
    
    var expenses = [
        Expense(
            n:"test", c:"cat test",v:20
        ),
        Expense(
            n:"test2", c:"cat test2",v:5000
        ),
        Expense(
            n:"test3", c:"cat test3",v:200000
        )
    ]
    
    mutating func addExpense(name: String, category: String, value: Double) {
        expenses.append(
            Expense(
                n:name, c:category,v:value
            )
        )
    }
    
}
