Gem::Specification.new do |s|
  s.name        = "jofi-generators"
  s.version     = "0.0.2"
  s.author      = "Jozef Fulop"
  s.email       = "jofi@silake.com"
  s.homepage    = "http://github.com/jofi/jofi-generators"
  s.summary     = "A collection of useful Rails generator scripts."
  s.description = "A collection of useful Rails generator scripts."
  
  s.files        = Dir["{lib,test,features,rails_generators}/**/*", "[A-Z]*"]
  s.require_path = "lib"
  
  s.rubyforge_project = s.name
  s.required_rubygems_version = ">= 1.3.4"
end
