# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tony_time/version"

Gem::Specification.new do |s|
  s.name        = "tony_time"
  s.version     = TonyTime::VERSION
  s.authors     = ["Tony Drake"]
  s.email       = ["t27duck@gmail.com"]
  s.homepage    = "http://tonyti.me"
  s.summary     = %q{Determines when the Tomy Time is}
  s.description = %q{Gem that drives tonyti.me}

  s.rubyforge_project = "tony_time"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
