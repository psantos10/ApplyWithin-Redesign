# -*- encoding: utf-8 -*-
# stub: medium-editor-rails 2.0.7 ruby lib

Gem::Specification.new do |s|
  s.name = "medium-editor-rails"
  s.version = "2.0.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Ahmet Sezgin Duran"]
  s.date = "2015-02-27"
  s.description = "Medium Editor integrated in Rails asset pipeline"
  s.email = ["marjinalist1@gmail.com"]
  s.homepage = "https://github.com/marjinal1st/medium-editor-rails"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Medium Editor integrated in Rails asset pipeline"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<railties>, [">= 3.0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
    else
      s.add_dependency(%q<railties>, [">= 3.0"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<railties>, [">= 3.0"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
  end
end
