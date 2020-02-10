#
# Be sure to run `pod lib lint SMNetworkManager.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SMNetworkManager'
  s.version          = '0.0.3'
  s.summary          = 'An Elegant network manager'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "Simple network manager with Alamofire"
  s.pod_target_xcconfig = {
     "SWIFT_VERSION" => "4.0",
  }
  s.homepage         = 'https://github.com/sureshmopidevi/SMNetworkManager.git'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'iosdevsureshmopidevi@gmail.com' => 'iosdevsureshmopidevi@gmail.com' }
  s.source           = { :git => 'https://github.com/sureshmopidevi/SMNetworkManager.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/mopidevisuresh'

  s.ios.deployment_target = '8.0'

  s.source_files = 'SMNetworkManager/Classes/**/*'
  
  # s.resource_bundles = {
  #   'SMNetworkManager' => ['SMNetworkManager/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
   s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'Alamofire'
end
