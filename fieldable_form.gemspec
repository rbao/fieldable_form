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

  s.files = Dir["{db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "railties"
  s.add_dependency "activerecord"

  s.add_development_dependency "sqlite3"

  s.add_development_dependency 'rspec'
  s.add_development_dependency "faker"
  s.add_development_dependency "factory_girl"
  s.add_development_dependency "simplecov"
end
