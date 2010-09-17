# coding: UTF-8

Gem::Specification.new do |s|
  s.name              = "gem"
  s.version           = "0.0.1"
  s.platform          = Gem::Platform::RUBY
  s.authors           = ["Gonçalo Silva"]
  s.email             = ["goncalossilva@gmail.com"]
  s.homepage          = "http://github.com/goncalossilva/gem_template"
  s.summary           = "Sample gem"
  s.description       = "A gem template"
  s.rubyforge_project = s.name

  s.required_rubygems_version = ">= 1.3.7"
  
  # If you have other dependencies, add them here
  # s.add_dependency "another", "~> 1.2"

  # If you need to check in files that aren't .rb files, add them here
  s.files         = `git ls-files`.split("\n")
  s.executables   = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.extensions    = `git ls-files ext/extconf.rb`.split("\n")
  
  s.require_path = 'lib'

  # For C extensions
  # s.extensions = "ext/extconf.rb"
end
