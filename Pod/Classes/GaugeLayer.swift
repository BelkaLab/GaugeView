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
    return CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2)
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
  override init(layer: AnyObject) {
    super.init(layer: layer)
    
    if (layer.isKindOfClass(GaugeLayer)) {
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
  override func actionForKey(event: String) -> CAAction? {
    if event == "stopAngle" {
      return createGaugeAnimation(event)
    }
    return super.actionForKey(event)
  }
  
  override class func needsDisplayForKey(key: String) -> Bool {
    if (key == "stopAngle") {
      return true
    }
    return super.needsDisplayForKey(key)
  }
  
  //MARK: - Setup methods
  private func setup() {
    self.contentsScale = UIScreen.mainScreen().scale
  }
  
  //MARK: - Animation methods
  private func createGaugeAnimation(key: String) -> CABasicAnimation {
    let animation = CABasicAnimation(keyPath: key)
    animation.fromValue = self.presentationLayer()?.valueForKey(key)
    animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
    animation.duration = Double(animationDuration)
    return animation
  }
  
  //MARK: - Draw methods
  private func drawGauge(startPoint: CGPoint) -> CGMutablePathRef {
    let path = CGPathCreateMutable()
    
    CGPathMoveToPoint(path, nil, startPoint.x, startPoint.y)
    
    CGPathAddLineToPoint(path, nil, (center.x + (radius) * CGFloat(cosf(startAngle))), center.y + (radius) * CGFloat(sinf(startAngle)))
    CGPathAddArc(path, nil, center.x, center.y, radius, CGFloat(startAngle), CGFloat(stopAngle), false)
    
    CGPathAddLineToPoint(path, nil, (center.x + CGFloat(radius - thickness) * CGFloat(cosf(stopAngle))), center.y + (radius - thickness) * CGFloat(sinf(stopAngle)))
    CGPathAddArc(path, nil, center.x, center.y, (radius - thickness), CGFloat(stopAngle), CGFloat(startAngle), true)
    
    return path
  }
  
  override func drawInContext(ctx: CGContext) {
    let startPoint = CGPointMake((center.x + (radius - thickness) * CGFloat(cosf(startAngle))), center.y + (radius - thickness) * CGFloat(sinf(startAngle)))
    
    CGContextSetShouldAntialias(ctx, true)
    
    CGContextAddArc(ctx, self.frame.size.width/2, self.frame.size.height/2, radius-(thickness/2), 0, CGFloat(2.0*M_PI), 0)
    CGContextSetLineWidth(ctx, thickness)
    CGContextSetLineCap(ctx, .Round)
    CGContextSetStrokeColorWithColor(ctx, gaugeBackgroundColor.CGColor)
    CGContextDrawPath(ctx, .Stroke)
    
    CGContextAddPath(ctx, drawGauge(startPoint))
    
    CGContextSetFillColorWithColor(ctx, gaugeColor.CGColor)
    
    CGContextDrawPath(ctx, .EOFill)
  }
  
  
  //MARK: - Class helper methods
  private func convertDegreesToRadius(degrees: CGFloat) -> CGFloat {
    return ((CGFloat(M_PI) * degrees) / 180.0)
  }
  
}
