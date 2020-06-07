#
# Be sure to run `pod lib lint GaugeView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
s.name             = "GaugeView"
s.version          = "0.1.5"
s.summary          = "Simple GaugeView in Swift"

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!
s.description      = <<-DESC
GaugeView is a small library to create and display Gauge graphs. It is fully customizable: you can set the color, size, text and many other properties of the graph. Do you need to display data in a simple way? Or you just wanto to add a fancy donut to your app? This is the library you were looking for!
DESC

s.homepage         = "https://github.com/BelkaLab/GaugeView"
s.license          = 'MIT'
s.author           = { "Belka" => "luca@b3lab.it" }
s.source           = { :git => "https://github.com/BelkaLab/GaugeView.git", :tag => s.version.to_s }
# s.social_media_url = 'https://twitter.com/BelkaDigitalLab'

s.platform     = :ios, '8.0'
s.requires_arc = true

s.source_files = 'Pod/Classes/**/*'
s.resource_bundles = {
'GaugeView' => ['Pod/Assets/*.png']
}

end
