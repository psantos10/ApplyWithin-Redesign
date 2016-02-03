# -*- encoding: utf-8 -*-
# stub: client_side_validations 3.2.7 ruby lib

Gem::Specification.new do |s|
  s.name = "client_side_validations"
  s.version = "3.2.7"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Brian Cardarella"]
  s.date = "2015-04-11"
  s.description = "Client Side Validations"
  s.email = ["bcardarella@gmail.com"]
  s.homepage = "https://github.com/bcardarella/client_side_validations"
  s.rubygems_version = "2.2.2"
  s.summary = "Client Side Validations"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rails>, ["~> 3.2.0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<mocha>, [">= 0"])
      s.add_development_dependency(%q<m>, [">= 0"])
      s.add_development_dependency(%q<sinatra>, ["~> 1.0"])
      s.add_development_dependency(%q<shotgun>, [">= 0"])
      s.add_development_dependency(%q<thin>, [">= 0"])
      s.add_development_dependency(%q<json>, [">= 0"])
      s.add_development_dependency(%q<coffee-script>, [">= 0"])
      s.add_development_dependency(%q<jquery-rails>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["~> 3.2.0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<mocha>, [">= 0"])
      s.add_dependency(%q<m>, [">= 0"])
      s.add_dependency(%q<sinatra>, ["~> 1.0"])
      s.add_dependency(%q<shotgun>, [">= 0"])
      s.add_dependency(%q<thin>, [">= 0"])
      s.add_dependency(%q<json>, [">= 0"])
      s.add_dependency(%q<coffee-script>, [">= 0"])
      s.add_dependency(%q<jquery-rails>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.2.0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<mocha>, [">= 0"])
    s.add_dependency(%q<m>, [">= 0"])
    s.add_dependency(%q<sinatra>, ["~> 1.0"])
    s.add_dependency(%q<shotgun>, [">= 0"])
    s.add_dependency(%q<thin>, [">= 0"])
    s.add_dependency(%q<json>, [">= 0"])
    s.add_dependency(%q<coffee-script>, [">= 0"])
    s.add_dependency(%q<jquery-rails>, [">= 0"])
  end
end
