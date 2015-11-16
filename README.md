# GaugeView

![Alt text](http://s4.postimg.org/c77hy8fpp/Gauge_View_Banner.png)

[![Version](https://img.shields.io/cocoapods/v/GaugeView.svg?style=flat)](http://cocoapods.org/pods/GaugeView)
[![License](https://img.shields.io/cocoapods/l/GaugeView.svg?style=flat)](http://cocoapods.org/pods/GaugeView)
[![Platform](https://img.shields.io/cocoapods/p/GaugeView.svg?style=flat)](http://cocoapods.org/pods/GaugeView)

## Introduction
GaugeView is a small library to create and display Gauge graphs. It is fully customizable: you can set the color, size, text and many other properties of the graph. Do you need to display data in a simple way? Or you just wanto to add a fancy donut to your app? This is the library you were looking for!


![Alt text](http://s30.postimg.org/mdxhaa6ch/i_Phone6.jpg)

## Requirements
* iOS 8+
* Xcode 7.0+

## Installation 
### CocoaPods
Add the GaugeView pod into your project and run `pod install`
```ruby
pod 'GaugeView'
```
### Manual Install
Download GaugeVIew and import `GaugeView.swift` and `GaugeLayer.swift` inside your xcode project.

## Sample App
To start using GaugeView you can build the provided example project

1. Open `Example/GaugeView.xcodeproj` in Xcode.
2. Build and run.

## Usage
It's very easy to set up, just import GaugeView in your Swift code:
```swift
import GaugeView
```
### Interface Builder:
Add an UIView with interface builder and set `GaugeView` as UIView custom class.

Link it with the outlet property declared in your code.

```swift
@IBOutlet private weak var gaugeView: GaugeView!
```

It's simple to customize! Here's an example of configuration of the view. Look at the Customization section for more details.

```swift
gaugeView.percentage = 80
gaugeView.thickness = 5
gaugeView.labelFont = UIFont.systemFontOfSize(40, weight: UIFontWeightThin)
gaugeView.labelColor = UIColor.lightGrayColor()
gaugeView.gaugeBackgroundColor = UIColor.lightGrayColor()
```

### Programmaticaly:
Declare a variable with GaugeView type

```swift 
private var gaugeView: GaugeView!
``` 

Instantiate and customize it. Make it fancy! Look at the Customization section to see more details.

```swift
gaugeView = GaugeView(frame: CGRect(x: 0, y:0, width: 100, height: 100)

gaugeView.percentage = 80
gaugeView.thickness = 5
gaugeView.labelFont = UIFont.systemFontOfSize(40, weight: UIFontWeightThin)
gaugeView.labelColor = UIColor.lightGrayColor()
gaugeView.gaugeBackgroundColor = UIColor.lightGrayColor()
```

## Customization
These are the customizable properties:

### Gauge

*  Float `startAngle`
*  CGFloat `thickness`
*  Float `percentage`
*  UIColor `gaugeBackgroundColor`
*  UIColor `gaugeColor`
*  Float `animationDuration`

### Label

* String `labelText`
* UIFont `labelFont`
* UIColor `labelColor`

## License
GaugeView is Copyright (c) 2015 Belka, srl. It is free software, and may be redistributed under the terms specified in the LICENSE file.  

## About Belka
![Alt text](http://s2.postimg.org/rcjk3hf5x/logo_rosso.jpg)

[Belka](http://belka.us/en) is a Digital Agency specialized in design, mobile applications development and custom solutions.
We love open source software! You can [see our projects](http://belka.us/en/portfolio/) or look at our case studies.

Interested? [Hire us](http://belka.us/en/contacts/) to help build your next amazing project. 

[www.belka.us](http://belka.us/en)
