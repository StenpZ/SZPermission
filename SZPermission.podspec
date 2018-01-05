
Pod::Spec.new do |s|

    s.name          = "SZPermission"
    s.version       = "1.0.0"
    s.summary       = "tool for ios to get system permissions."

    s.homepage      = "https://github.com/StenpZ/SZPermission"
    s.license       = "MIT"

    s.author        = { "StenpZ" => "zhouc520@foxmail.com" }
    s.source        = { :git => "https://github.com/StenpZ/SZPermission.git", :tag => "#{s.version}" }
    s.public_header_files = 'SZPermission/**/*.{h}'
    s.source_files  = "SZPermission/**/*.{h,m}"
    s.platform      = :ios,'8.0'
    s.requires_arc = true

end
