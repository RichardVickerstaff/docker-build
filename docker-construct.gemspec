# coding: utf-8
require File.expand_path('../lib/version', __FILE__)
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "docker-construct"
  spec.version       = DockerConstruct::VERSION
  spec.authors       = ["Richard Vickerstaff"]
  spec.email         = ["m3akq@btinternet.com"]
  spec.description   = ""
  spec.summary       = ""
  spec.homepage      = "https://github.com/RichardVickerstaff/docker-build"
  spec.license       = "MIT"
  spec.files         = `git ls-files`.split($/)
  spec.require_paths = ["lib","tasks"]

  spec.add_runtime_dependency "rake", "~> 10"
end
