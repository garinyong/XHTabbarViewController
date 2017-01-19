Pod::Spec.new do |s|
s.name             = "XHTabbarViewController"
s.version          = "1.0.6"
s.summary          = "Custom tabbarviewcontroller, you can change the tabbar height, hide or show tabbar"
s.homepage         = "https://github.com/garinyong/XHTabbarViewController"
s.author           = { "高勇" => "garinspring@163.com" }
s.source           = { :git => "https://github.com/garinyong/XHTabbarViewController.git", :tag => "1.0.6" }
s.platform     = :ios, '6.0'
s.requires_arc = true
s.license = { :type => 'MIT', :file => 'LICENSE.md' }
s.source_files = 'XHTabbarViewController/*'
# s.resources = 'Assets'

# s.ios.exclude_files = 'Classes/osx'
# s.osx.exclude_files = 'Classes/ios'
# s.public_header_files = 'Classes/**/*.h'
s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit'

end
