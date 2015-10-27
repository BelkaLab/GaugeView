![Alt text](http://s4.postimg.org/c77hy8fpp/Gauge_View_Banner.png)

# GaugeView

## Introduction


## Requiremetns
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
To start to use GaugeView you can use the provided example

1. Open `GaugeExample.xcodeproj` in Xcode.
2. Build and run.

## Usage
It's very easy to set it, import GaugeView in your Swift:
```swift
	import GaugeView
```
### Interface Builder:
Add a UIView with interface builder and set `GaugeView` as UIView custom class.

Link it with the outlet property declared in your code.

```swift
	@IBOutlet private weak var gaugeView: GaugeView!
```

It's simple to customize! Here's an example of configuration of the view. Look at the Customization section to see more details.

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
Those are the customizable properties:

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

Belka is a Digital Agency specialized in design and develop mobile application and custom solutions.
We love open source software! You can see our project or look at our case studies.

Interested? hire us to help build you next amazing project. 

www.belka.us