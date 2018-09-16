Pod::Spec.new do |s|
 s.name = 'CoordinatorKit'
 s.version = '1.0.0'
 s.license = { :type => "MIT", :file => "LICENSE" }
 s.summary = 'Coordinator chain responsability'
 s.homepage = 'http://brunofernandes.me'
 s.social_media_url = 'https://twitter.com/bfernandesbfs'
 s.authors = { "Bruno Fernandes" => "bruno.fernandesbfs@gmail.com" }
 s.source = { :git => "https://github.com/bfernandesbfs/CoordinatorKit.git", :tag => "v"+s.version.to_s }
 s.platforms = { :ios => "8.0", :osx => "10.10", :tvos => "9.0", :watchos => "2.0" }
 s.requires_arc = true

 s.default_subspec = "Core"
 s.subspec "Core" do |ss|
     ss.source_files  = "Sources/**/*.swift"
     ss.framework  = "Foundation"
 end
end
