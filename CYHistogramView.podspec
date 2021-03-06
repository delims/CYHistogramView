#
# Be sure to run `pod lib lint CYHistogramView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'CYHistogramView'
  s.version          = '1.0.0'
  s.summary          = 'A simple histogram.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: A simple histogram.
                       DESC

  s.homepage         = 'https://github.com/delims/CYHistogramView'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'delims' => 'delims@qq.com' }
  s.source           = { :git => 'https://github.com/delims/CYHistogramView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'CYHistogramView/Classes/**/*'
  
  # s.resource_bundles = {
  #   'CYHistogramView' => ['CYHistogramView/Assets/*.png']
  # }

   s.public_header_files = 'CYHistogramView/Classes/**/*.h'
   s.frameworks = 'UIKit', 'Foundation'
  # s.dependency 'AFNetworking', '~> 2.3'
end
