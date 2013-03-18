$:.push File.expand_path("../lib", __FILE__)

require "fieldable_form/version"

Gem::Specification.new do |s|
  s.name        = "fieldable_form"
  s.version     = FieldableForm::VERSION
  s.authors     = ["Roy Y. Bao"]
  s.email       = ["roybao2010@gmail.com"]
  s.homepage    = "https://github.com/rbao/fieldable_form"
  s.summary     = "FieldableForm allows you to easily build an end user facing form builder."
  s.description = "FieldableForm allows you to easily build an end user facing form builder."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.12"
  s.add_dependency "coffee-rails", "~> 3.2.1"
  s.add_dependency "jquery-rails", "~> 2.2.0"

  s.add_development_dependency "mysql2", "~> 0.3.11"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "faker"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "simplecov"
end
