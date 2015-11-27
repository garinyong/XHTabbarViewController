Pod::Spec.new do |s|
s.name             = "XHTabbarViewController"
s.version          = "1.0.0"
s.summary          = "Custom tabbarviewcontroller, you can change the tabbar height, hide or show tabbar"
s.description      = <<-DESC
It is custom tabbarviewcontroller used on iOS, which implement by Objective-C.
DESC
s.homepage         = "https://github.com/garinyong/XHTabbarViewController"
# s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
s.license          = 'MIT'
s.author           = { "高勇" => "garinspring@163.com" }
s.source           = { :git => "https://github.com/garinyong/XHTabbarViewController.git", :tag => "1.0.0" }
# s.social_media_url = 'http://www.weibo.com/u/2129091951'

s.platform     = :ios, '6.0'
# s.ios.deployment_target = '6.0'
# s.osx.deployment_target = '10.7'
s.requires_arc = true

s.source_files = 'XHTabbarViewControllerDemo/*'
# s.resources = 'Assets'

# s.ios.exclude_files = 'Classes/osx'
# s.osx.exclude_files = 'Classes/ios'
# s.public_header_files = 'Classes/**/*.h'
s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'

end