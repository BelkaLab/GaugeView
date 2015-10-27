//
//  ViewController.swift
//  Gauge
//
//  Created by Luca D'Incà on 18/10/15.
//  Copyright © 2015 Luca D'Incà. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private var gaugeView: GaugeView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        GaugeView()
        
        //Gauge View example
        gaugeView.percentage = 80
        gaugeView.thickness = 5
        
        gaugeView.labelFont = UIFont.systemFontOfSize(40, weight: UIFontWeightThin)
        gaugeView.labelColor = UIColor.lightGrayColor()
        gaugeView.gaugeBackgroundColor = UIColor.lightGrayColor()
        gaugeView.labelText = "80%"
    }


    @IBAction func didPressOnButton(sender: AnyObject) {
        let randomValue = arc4random_uniform(100)
        gaugeView.percentage = Float(randomValue)
        gaugeView.labelText = "\(randomValue)%"
    }
}

