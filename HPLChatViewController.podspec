Pod::Spec.new do |s|
  s.name         = "HPLChatViewController"
  s.version      = "0.0.1"
  s.summary      = "HPLChatViewController is a component for making sms like screens on iOS. It is a fork of https://github.com/AlexBarinov/UIBubbleTableView, which is no longer maintained."

  s.homepage     = "https://github.com/huffpostlabs/HPLChatViewController"

  s.license      = { :type => 'Creative Commons Attribution-ShareAlike 3.0 Unported', :file => 'LICENSE' }
  
  s.author       = { "Matthew Conlen" => "mc@mathisonian.com" }
  
  s.source       = { :git => "https://github.com/huffpostlabs/HPLChatViewController", :tag => "0.0.1" }

  s.source_files = 'Classes', 'Classes/**/*.{h,m}'

  s.resources = "Images", "Images/**/*.png"

end
