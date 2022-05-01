# -*- encoding: utf-8 -*-
# stub: simple_xlsx_reader 1.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "simple_xlsx_reader".freeze
  s.version = "1.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Woody Peterson".freeze]
  s.date = "2018-07-12"
  s.description = "Read xlsx data the Ruby way".freeze
  s.email = ["woody.peterson@gmail.com".freeze]
  s.homepage = "".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.2".freeze
  s.summary = "Read xlsx data the Ruby way".freeze

  s.installed_by_version = "3.1.2" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<nokogiri>.freeze, [">= 0"])
    s.add_runtime_dependency(%q<rubyzip>.freeze, [">= 0"])
    s.add_development_dependency(%q<minitest>.freeze, [">= 5.0"])
    s.add_development_dependency(%q<rake>.freeze, [">= 0"])
    s.add_development_dependency(%q<pry>.freeze, [">= 0"])
  else
    s.add_dependency(%q<nokogiri>.freeze, [">= 0"])
    s.add_dependency(%q<rubyzip>.freeze, [">= 0"])
    s.add_dependency(%q<minitest>.freeze, [">= 5.0"])
    s.add_dependency(%q<rake>.freeze, [">= 0"])
    s.add_dependency(%q<pry>.freeze, [">= 0"])
  end
end
