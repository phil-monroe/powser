# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "powser"

Gem::Specification.new do |s|
  s.name              = "powser"
  s.version           = Powser::VERSION
  s.platform          = Gem::Platform::RUBY
  s.authors           = ["Phil Monroe"]
  s.email             = ["phil@philmonroe.com.com"]
  s.homepage          = "http://github.com/phil-monroe/powser"
  s.summary           = "Powder from your browser."
  s.description       = "A simple web server interface to Powder."
  s.rubyforge_project = s.name

  s.required_rubygems_version = ">= 1.3.6"
  
  # If you have runtime dependencies, add them here
  s.add_dependency 'thor', '>=0.11.5'
  s.add_dependency "sinatra", '>=1.3.1'
  

  # The list of files to be contained in the gem
  s.files         = `git ls-files`.split("\n")
  s.executables   = ["powser"]
  s.require_paths = ["lib"]
  
  s.require_path = 'lib'

  # For C extensions
  # s.extensions = "ext/extconf.rb"
end
