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
//  GaugeLayer.swift
//  GaugeLayer
//
//  Created by Luca D'Incà on 18/10/15.
//  Copyright © 2015 BELKA S.R.L. All rights reserved.
//

import UIKit

class GaugeLayer: CALayer {
  
  ///
  // Class costants
  ///
  
  private let kStartAngle: Float = 0.0
  private let kStopAngle: Float = 360.0
  
  ///
  // Class property
  ///
  
  private var center: CGPoint {
    return CGPoint(x: self.bounds.size.width/2, y: self.bounds.size.height/2)
  }
  
  //Layer propery
  var startAngle: Float = 0.0
  
  var radius: CGFloat!
  
  var thickness: CGFloat!
  
  var gaugeBackgroundColor: UIColor!
  
  var gaugeColor: UIColor!
  
  var animationDuration: Float!
  
  //Animated property
  @NSManaged var stopAngle: Float
  
  ///
  // Class methods
  ///
  
  //MARK: - Init methods
  override init(layer: Any) {
    super.init(layer: layer)
    
    if ((layer as! AnyObject).isKind(of: GaugeLayer.self)) {
      if let previous = layer as? GaugeLayer {
        startAngle = previous.startAngle
        stopAngle = previous.stopAngle
        
        radius = previous.radius
        thickness = previous.thickness
        gaugeBackgroundColor = previous.gaugeBackgroundColor
        gaugeColor = previous.gaugeColor
      }
    }
    
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }
  
  //MARK: -
  override func action(forKey event: String) -> CAAction? {
    if event == "stopAngle" {
      return createGaugeAnimation(key: event)
    }
    return super.action(forKey: event)
  }
  
  override class func needsDisplay(forKey key: String) -> Bool {
    if (key == "stopAngle") {
      return true
    }
    return super.needsDisplay(forKey: key)
  }
  
  //MARK: - Setup methods
  private func setup() {
    self.contentsScale = UIScreen.main.scale
  }
  
  //MARK: - Animation methods
  private func createGaugeAnimation(key: String) -> CABasicAnimation {
    let animation = CABasicAnimation(keyPath: key)
    animation.fromValue = self.presentation()?.value(forKey: key)
    animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
    animation.duration = Double(animationDuration)
    return animation
  }
  
  //MARK: - Draw methods
  private func drawGauge(startPoint: CGPoint) -> CGMutablePath {
    let path = CGMutablePath()
    
    path.move(to: startPoint)
    
    path.addLine(to: CGPoint(x: (center.x + (radius) * CGFloat(cosf(startAngle))), y: center.y + (radius) * CGFloat(sinf(startAngle))))
    path.addArc(center: CGPoint(x: center.x, y: center.y), radius: radius, startAngle: CGFloat(startAngle), endAngle: CGFloat(stopAngle), clockwise: false)
    
    path.addLine(to: CGPoint(x: (center.x + CGFloat(radius - thickness) * CGFloat(cosf(stopAngle))), y: center.y + (radius - thickness) * CGFloat(sinf(stopAngle))))
    path.addArc(center: CGPoint(x: center.x, y: center.y), radius: (radius - thickness), startAngle: CGFloat(stopAngle), endAngle: CGFloat(startAngle), clockwise: true)
    
    return path
  }
  
  override func draw(in ctx: CGContext) {
    let startPoint = CGPoint(x: (center.x + (radius - thickness) * CGFloat(cosf(startAngle))), y: center.y + (radius - thickness) * CGFloat(sinf(startAngle)))
    
    ctx.setShouldAntialias(true)
    
    ctx.addArc(center: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2), radius: radius-(thickness/2), startAngle: 0, endAngle: CGFloat(2.0*M_PI), clockwise: false)
    ctx.setLineWidth(thickness)
    ctx.setLineCap(.round)
    ctx.setStrokeColor(gaugeBackgroundColor.cgColor)
    ctx.drawPath(using: .stroke)
    
    ctx.addPath(drawGauge(startPoint: startPoint))
    
    ctx.setFillColor(gaugeColor.cgColor)
    
    ctx.drawPath(using: .eoFill)
  }
  
  
  //MARK: - Class helper methods
  private func convertDegreesToRadius(degrees: CGFloat) -> CGFloat {
    return ((CGFloat(M_PI) * degrees) / 180.0)
  }
  
}
