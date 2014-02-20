$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ldmc/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ldmc"
  s.version     = Ldmc::VERSION
  s.authors     = ["Catalina Bustamante"]
  s.email       = ["catalinabustam@gmail.com"]
  s.homepage    = "http://www.iatm.com.co"
  s.summary     = "ldmc: Engine para formulario de lectura del proyecto -Lesiones Desmielinizantes en la medula Cervical-"
  s.description = "Mountable engine para formulario de lectura del proyecto -Lesiones Desmielinizantes en la medula Cervical-, como modulo encima de IATM coredb."

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.0.2"
  s.add_development_dependency "mongoid"
end
