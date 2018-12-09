Pod::Spec.new do |s|
  s.name         = "KxMenu"
  s.version      = "1.0.1"
  s.summary      = "KxMenu - a iOS network debug library ,It can monitor HTTP requests within the App and displays information related to the request."
  s.homepage     = "https://github.com/natoto"
  s.license      = "MIT"
  s.authors      = { "nonato" => "nonato@foxmail.com" }
  s.source       = { :git => "https://github.com/natoto/KxMenu.git", :tag => "1.0.1" }
  s.frameworks   = 'Foundation', 'CoreGraphics', 'UIKit'
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.default_subspec = 'standard'   
  s.subspec 'standard' do |ss|
    ss.source_files = 'KxMenu/**/*.{h,m,png}'
  end 

end