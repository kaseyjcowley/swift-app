//
//  PayoffProgressMeter.swift
//  debt-payoff-swift
//
//  Created by Kasey Cowley on 5/5/16.
//  Copyright © 2016 Kasey Cowley. All rights reserved.
//

import UIKit

class PayoffProgressMeter: UIView {
    
    let COLOR: UIColor = UIColor(
        red: 0.87,
        green: 0.95,
        blue: 0.75,
        alpha: 1.0
    )
    
    init(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) {
        super.init(frame: CGRect(x: x, y: y, width: width, height: height))
        
        self.backgroundColor = COLOR
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
