//
//  DebtTableViewController.swift
//  debt-payoff-swift
//
//  Created by Kasey Cowley on 5/1/16.
//  Copyright © 2016 Kasey Cowley. All rights reserved.
//

import UIKit

class DebtTableViewController: UITableViewController {
    
  // MARK: Properties
  var debts: [Debt] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    debts.append(
      Debt(name: "CapitalOne Credit Card", amount: 200.0, balance: 100.0, payment: 25.0, dueDate: 1)
    )
    
    debts.append(
      Debt(name: "Auto Loan", amount: 5000.0, balance: 3500.0, payment: 300.0, dueDate: 1)
    )
    
    debts.append(
      Debt(name: "Home Loan", amount: 280000.00, balance: 265000.00, payment: 1600.0, dueDate: 1)
    )
  }
  
  override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return debts.count
  }
  
  override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCellWithIdentifier("DebtTableViewCell", forIndexPath: indexPath) as! DebtTableViewCell
    let debt = debts[indexPath.row]
    
    let formatter = NSNumberFormatter()
    formatter.numberStyle = .CurrencyStyle
    
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat = "MMM yyyy"
    
    let progressMeterH = CGFloat(10)
    let progressMeterW = cell.frame.width * CGFloat(debt.percentagePaid())
    let progressMeterX = CGFloat(0)
    let progressMeterY = cell.frame.height - progressMeterH
    
    cell.amountLabel.text = formatter.stringFromNumber(debt.balance)
    cell.debtNameLabel.text = debt.name
    cell.paymentLabel.text = "Payment: " + formatter.stringFromNumber(debt.payment)!
    cell.payoffDateLabel.text = "Payoff : \(dateFormatter.stringFromDate(debt.payoffDate()!))"
    
    cell.addSubview(
      PayoffProgressMeter(
        x: progressMeterX,
        y: progressMeterY,
        width: progressMeterW,
        height: progressMeterH
      )
    )
    
    return cell
  }
  
  override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
    
    coordinator.animateAlongsideTransition(
      {(UIViewControllerTransitionCoordinatorContext) -> Void in},
      
      completion: {(UIViewControllerTransitionCoordinatorContext) -> Void in
        self.tableView.reloadData()
      }
    )
    
    super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
    
  }

}
