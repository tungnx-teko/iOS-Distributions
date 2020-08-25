Pod::Spec.new do |s|
    s.name         = "Example"
    s.version      = "0.1.0"
    s.summary      = "Example SDK"
    s.description  = <<-DESC
    Minerva project
    DESC
    s.homepage     = "https://github.com/tungnx-teko/iOS-Distributions"
    s.license = { :type => 'Copyright', :text => <<-LICENSE
                   Copyright 2020
                   Permission is granted to...
                  LICENSE
                }
    s.author             = { "$(git config user.name)" => "$(git config user.email)" }
    s.source       = { :http => "https://github.com/tungnx-teko/iOS-Distributions/releases/download/#{s.name}-v#{s.version}/#{s.name}.zip" }
    s.public_header_files = "Example.framework/Headers/*.h"
    s.source_files = "Example.framework/Headers/*.{h, m, swift}"
    s.vendored_frameworks = "Example.framework"
    s.platform = :ios, "10.0"
    s.dependency "Alamofire"
end