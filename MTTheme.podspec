#
# Be sure to run `pod lib lint Module_Chat.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MTTheme'
  s.version          = '1.0.0'
  s.summary          = '组件化设计，主题国际化模块'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
	组件化设计，主题国际化模块。
  可设置自定义主题，和本地国际化
                       DESC

  s.homepage         = 'https://github.com/ireliaBR/MTTheme'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { '672575302@qq.com' => '672575302@qq.com' }
  s.source           = { :git => 'https://github.com/ireliaBR/MTTheme.git', :tag => s.version.to_s }


  s.ios.deployment_target = '8.0'
  s.source_files = 'MTTheme/MTTheme/**/*.{h,m}'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  
  s.frameworks = 'UIKit', 'AVFoundation'
end
