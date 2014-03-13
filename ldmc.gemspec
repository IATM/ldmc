$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ldmc/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ldmc"
  s.version     = Ldmc::VERSION
  s.authors     = ["Catalina Bustamante"]
  s.email       = ["catalina.bustamante@iatm.com.co"]
  s.homepage    = "http://www.iatm.com.co"
  s.summary     = "EMTrack: Engine para historia clinica de esclerosis multiple"
  s.description = "Mountable engine para historia clinica en esclerosis multiple, como modulo encima de IATM coredb"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.2"
  s.add_dependency "mongoid"
  # s.add_development_dependency "mongoid"
end
