$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "spina/components/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "spina-components"
  s.version     = Spina::Components::VERSION
  s.authors     = ["Grace Han"]
  s.email       = ["hanpanpan200@gmail.com"]
  s.homepage    = "http://www.shinetechchina.com/"
  s.summary     = "Component system for Spina"
  s.description = "Plugin for Spina CMS to include components on your website"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"

  s.add_development_dependency "sqlite3"
end
