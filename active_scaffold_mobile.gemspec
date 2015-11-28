# -*- encoding: utf-8 -*-
$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'active_scaffold_mobile/version'

Gem::Specification.new do |s|
  s.name = %q{active_scaffold_mobile}
  s.version = ActiveScaffoldMobile::Version::STRING
  s.platform = Gem::Platform::RUBY
  s.email = %q{activescaffold@googlegroups.com}
  s.authors = ["Sergio Cambra"]
  s.homepage = %q{http://activescaffold.com}
  s.summary = %q{Column configuration specific for mobile and tablet devices for ActiveScaffold}
  s.description = %q{Developer may set specific columns for mobile and tablet devices, have tablet devices with own setup or fallback to phone setup}
  s.require_paths = ["lib"]
  s.files = `git ls-files -- app config lib`.split("\n") + %w[LICENSE.txt README.md]
  s.extra_rdoc_files = [
    "README.md"
  ]
  s.licenses = ["MIT"]

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=

  s.add_runtime_dependency(%q<active_scaffold>, [">= 3.4.31"])
  s.add_runtime_dependency(%q<rails>, [">= 4.1.0"])
  s.add_runtime_dependency(%q<mobile-fu>, ["~> 1.3"])
end
