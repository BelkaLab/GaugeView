//
//  ViewController.swift
//  GaugeView
//
//  Created by Omar Albeik on 9/27/16.
//  Copyright © 2016 omaralbeik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	
	@IBOutlet weak var gaugeView: GaugeView!
	@IBOutlet weak var updateButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		gaugeView.startAngle = 270
		
		updateButton.addTarget(self, action: #selector(self.updateGauge), for: .touchUpInside)
	}
	
	func updateGauge() {
		let random = Float.randomBetween(min: 0, max: 100)
		gaugeView.percentage = random
		
	}
	
}

extension Float {
	/// Return random double value between two double values.
	public static func randomBetween(min: Float, max: Float) -> Float {
		let delta = max - min
		return min + Float(arc4random_uniform(UInt32(delta)))
	}
}
