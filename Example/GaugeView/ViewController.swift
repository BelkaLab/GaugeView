//
//  ViewController.swift
//  GaugeView
//
//  Created by Luca D'Incà on 11/01/2015.
//  Copyright (c) 2015 Luca D'Incà. All rights reserved.
//

import UIKit
import GaugeView

class ViewController: UIViewController {
  
  @IBOutlet private weak var gaugeView: GaugeView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //Gauge View example
    gaugeView.percentage = 80
    gaugeView.thickness = 10
    
    gaugeView.labelFont = UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.thin)
    gaugeView.labelColor = UIColor.lightGray
    gaugeView.gaugeBackgroundColor = UIColor.lightGray
    gaugeView.labelText = "80%"
    
    gaugeView.accessibilityLabel = "Gauge"
  }
  
  
  @IBAction func didPressOnButton(_ sender: AnyObject) {
    let randomValue = arc4random_uniform(100)
    gaugeView.percentage = Float(randomValue)
    gaugeView.labelText = "\(randomValue)%"
  }
  
  @IBAction func didPressOnChangeColorButton(_ sender: AnyObject) {
    gaugeView.gaugeColor = UIColor.blue
    gaugeView.gaugeBackgroundColor = UIColor.red
    gaugeView.thickness = 45
  }
}

