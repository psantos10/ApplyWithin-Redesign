# -*- encoding: utf-8 -*-
# stub: hermitage 0.0.6 ruby lib

Gem::Specification.new do |s|
  s.name = "hermitage"
  s.version = "0.0.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Alexander Borovykh"]
  s.date = "2013-09-27"
  s.description = "Ruby library for image galleries generation."
  s.email = ["immaculate.pine@gmail.com"]
  s.homepage = "http://immaculatepine.github.io/hermitage/"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "Ruby library for image galleries generation (thumbnails and original images viewer)."

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, [">= 3.2"])
      s.add_runtime_dependency(%q<jquery-rails>, [">= 0"])
      s.add_runtime_dependency(%q<coffee-rails>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.3"])
      s.add_development_dependency(%q<rake>, [">= 0"])
      s.add_development_dependency(%q<rspec-rails>, [">= 0"])
      s.add_development_dependency(%q<capybara>, [">= 0"])
      s.add_development_dependency(%q<sqlite3>, [">= 0"])
      s.add_development_dependency(%q<therubyracer>, [">= 0"])
      s.add_development_dependency(%q<poltergeist>, [">= 0"])
      s.add_development_dependency(%q<genspec>, [">= 0"])
    else
      s.add_dependency(%q<rails>, [">= 3.2"])
      s.add_dependency(%q<jquery-rails>, [">= 0"])
      s.add_dependency(%q<coffee-rails>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.3"])
      s.add_dependency(%q<rake>, [">= 0"])
      s.add_dependency(%q<rspec-rails>, [">= 0"])
      s.add_dependency(%q<capybara>, [">= 0"])
      s.add_dependency(%q<sqlite3>, [">= 0"])
      s.add_dependency(%q<therubyracer>, [">= 0"])
      s.add_dependency(%q<poltergeist>, [">= 0"])
      s.add_dependency(%q<genspec>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, [">= 3.2"])
    s.add_dependency(%q<jquery-rails>, [">= 0"])
    s.add_dependency(%q<coffee-rails>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.3"])
    s.add_dependency(%q<rake>, [">= 0"])
    s.add_dependency(%q<rspec-rails>, [">= 0"])
    s.add_dependency(%q<capybara>, [">= 0"])
    s.add_dependency(%q<sqlite3>, [">= 0"])
    s.add_dependency(%q<therubyracer>, [">= 0"])
    s.add_dependency(%q<poltergeist>, [">= 0"])
    s.add_dependency(%q<genspec>, [">= 0"])
  end
end
