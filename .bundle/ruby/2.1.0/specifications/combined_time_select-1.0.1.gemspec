# -*- encoding: utf-8 -*-
# stub: combined_time_select 1.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "combined_time_select"
  s.version = "1.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Chris Oliver"]
  s.date = "2013-06-22"
  s.description = "Generates a time_select field like Google calendar."
  s.email = ["excid3@gmail.com"]
  s.homepage = "https://github.com/excid3/combined_time_select"
  s.rubyforge_project = "combined_time_select"
  s.rubygems_version = "2.2.2"
  s.summary = "A Rails time_select like Google Calendar with combined hour and minute time_select"

  s.installed_by_version = "2.2.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rake>, [">= 0"])
    else
      s.add_dependency(%q<rake>, [">= 0"])
    end
  else
    s.add_dependency(%q<rake>, [">= 0"])
  end
end
