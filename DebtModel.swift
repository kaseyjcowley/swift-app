//
//  DebtModel.swift
//  debt-payoff-swift
//
//  Created by Kasey Cowley on 5/1/16.
//  Copyright © 2016 Kasey Cowley. All rights reserved.
//

import Foundation

class Debt {
    
    // The name of the debt
    var name: String
    
    // The initial amount of the debt
    var amount: Double
    
    // The remaining balance of the debt
    var balance: Double
    
    // The payment amount
    var payment: Double
    
    // When the payment is due
    var dueDate: Int
    
    init(
        name: String,
        amount: Double,
        balance: Double,
        payment: Double,
        dueDate: Int
    ) {
        self.name = name
        self.amount = amount
        self.balance = balance
        self.payment = payment
        self.dueDate = dueDate
    }
    
    func percentagePaid() -> Double {
        return (self.amount - self.balance) / self.amount
    }
    
    func payoffDate() -> NSDate? {
        let monthsLeftToPayoff = Int(ceil(self.balance / self.payment))
        
        return NSCalendar.currentCalendar().dateByAddingUnit(
            .Month,
            value: monthsLeftToPayoff,
            toDate: NSDate(),
            options: NSCalendarOptions(rawValue: 0)
        )
    }
    
}