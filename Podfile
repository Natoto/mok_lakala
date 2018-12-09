platform :ios, '8.0'

#use_frameworks!

def commompod
    
    $LOCALPATH = "/Users/boo/Documents/demo/mok_lakala/RevealPod "
    pod "RNetworkEye", :path =>$LOCALPATH                     #network eye
    pod "KxMenu", :path =>$LOCALPATH                           #按钮
    
    source 'https://github.com/CocoaPods/Specs.git'
    pod 'JRSwizzle', '~> 1.0'
    pod 'FLEX', '~> 2.0', :configurations => ['Debug']
    pod 'AFNetworking'
    #pod 'Qiniu', :git => 'https://github.com/qiniu/objc-sdk.git', :branch => 'AFNetworking-3.x'
end

target 'mok_lakala' do
    
    commompod();

end

target 'mok_lakalaDylib' do
     
commompod();
end
