Pod::Spec.new do |s|

  s.name         = "BasePod"
  s.version      = "BasePodVersion"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.summary      = "BasePod written in Swift"
  s.homepage     = "https://github.com/comodinx/BasePod"
  s.authors      = { "Nicolas Molina" => "comodinx@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/comodinx/BasePod.git", :tag => s.version }

  s.source_files = "Sources/*.swift"

end
