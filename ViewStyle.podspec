
Pod::Spec.new do |s|

  s.name         = "ViewStyle"
  s.version      = "1.0.0"
  s.summary      = "Provides a way to set UIView's visual appearance properties like CSS"
  s.homepage     = "https://github.com/southpeak/ViewStyle"
  s.license      = "MIT"

  s.author             = "Minya"
  s.social_media_url   = "http://weibo.com/touristdiary"

  s.source       = { :git => "https://github.com/southpeak/ViewStyle.git", :tag => "#{s.version}" }

  s.ios.deployment_target = '8.0'

  # s.source_files  = "Source/*.swift"

  s.subspec 'Core' do |core|
  	core.source_files = "Source/Core"
  end

  s.subspec 'Extensions' do |ex|
  	ex.source_files = "Source/Extensions"
  	ex.dependency "ViewStyle/Core"
  end

end
