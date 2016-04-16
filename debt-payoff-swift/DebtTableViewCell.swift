//
//  DebtTableViewCell.swift
//  debt-payoff-swift
//
//  Created by Kasey Cowley on 5/1/16.
//  Copyright © 2016 Kasey Cowley. All rights reserved.
//

import UIKit

class DebtTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var debtNameLabel: UILabel!
    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var payoffProgressBar: UIProgressView!
    @IBOutlet weak var payoffDateLabel: UILabel!
    
}
