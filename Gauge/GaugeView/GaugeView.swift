//   .-
//  `+d/
//  -hmm/
//  ommmm/
//  `mmmmm/
//  `mmmmm/ .:+ssyso+-`
//  `mmmmmsydmmmmmmmmmho.
//  `mmmmmmh+:---/+ssssyd:
//  `mmmmmh.     /     .md-
//  `mmmmmo..-`       .ommo
//  `mmmmm+..`    ./oydmmm/
//  `mmmmm/      /dmmmmmmh`
//  `mmmmm/    `smmmmmmms`
//  `mmmmm/  `+dmmmmmy+.
//  :::::.   `-::-.`
//
//  GaugeView.swift
//  GaugeView
//
//  Created by Luca D'Incà on 18/10/15.
//  Copyright © 2015 BELKA S.R.L. All rights reserved.
//

import UIKit

@IBDesignable
class GaugeView: UIView {
    
    ///
    // Class proprty
    ///
    
    private var label: UILabel!
    
    private var gaugeLayer: GaugeLayer!
    
    //Gauge property
    
    var startAngle: Float = 0.0
    
    var radius: CGFloat {
        return min(self.bounds.width, self.bounds.height)/2
    }
    
    var thickness: CGFloat = 20
    
    var animationDuration: Float = 0.5
    
    var percentage: Float = 20 {
        didSet {
            gaugeLayer.stopAngle  = convertPercentageInRadius(percentage)
        }
    }
    
    var gaugeBackgroundColor: UIColor = UIColor.grayColor()
    
    var gaugeColor: UIColor = UIColor.redColor()
    
    //Label property
    
    var labelText: String = "" {
        didSet {
            label.text = labelText
            updateTextLabel()
        }
    }
    
    var labelFont: UIFont? {
        didSet {
            if let labelFont = labelFont {
                label.font = labelFont
                updateTextLabel()
            }
        }
    }
    
    var labelColor: UIColor? {
        didSet {
            if let labelColor = labelColor {
                label.textColor = labelColor
                updateTextLabel()
            }
        }
    }
    
    ///
    // Class methods
    ///
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setup()
    }
    
    //MARK: - Draw method
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        
        gaugeLayer.radius = radius
        gaugeLayer.thickness = thickness
        gaugeLayer.frame = self.bounds
        gaugeLayer.gaugeBackgroundColor = gaugeBackgroundColor
        gaugeLayer.gaugeColor = gaugeColor
        gaugeLayer.animationDuration = animationDuration
        gaugeLayer.startAngle = convertDegreesToRadius(startAngle)
        gaugeLayer.stopAngle = convertPercentageInRadius(percentage)
        
        updateTextLabel()
    }
    
    //MARK: - Setup method
    private func setup() {
        createGaugeView()
        createTitleLabel()
    }
    
    private func createGaugeView() {
        gaugeLayer = GaugeLayer(layer: layer)
        
        gaugeLayer.radius = radius
        gaugeLayer.thickness = thickness
        gaugeLayer.frame = self.bounds
        gaugeLayer.gaugeBackgroundColor = gaugeBackgroundColor
        gaugeLayer.gaugeColor = gaugeColor
        gaugeLayer.animationDuration = animationDuration
        gaugeLayer.startAngle = convertDegreesToRadius(startAngle)
        gaugeLayer.stopAngle = convertPercentageInRadius(percentage)
        
        layer.addSublayer(gaugeLayer)
    }
    
    private func createTitleLabel() {
        label = UILabel(frame: CGRect(origin: CGPointZero, size: CGSizeZero))
        
        updateTextLabel()
        
        self.addSubview(label)
    }
    
    private func updateTextLabel() {
        label.sizeToFit()
        label.center = CGPoint(x: self.bounds.width/2, y: self.bounds.height/2)
    }
    
    //MARK: - Utility method
    private func convertPercentageInRadius(percentage: Float) -> Float {
        return convertDegreesToRadius((360.0 / 100.0 * percentage) + startAngle)
    }
    
    private func convertDegreesToRadius(degrees: Float) -> Float {
        return ((Float(M_PI) * degrees) / 180.0)
    }
    
}
