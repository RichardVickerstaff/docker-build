require 'rake/clean'
require 'rake-n-bake'
require './lib/docker-construct'

@external_dependencies = %w[ruby rake]

task :default => [
  :clean,
  :"bake:check_external_dependencies",
  :"bake:code_quality:all",
  :"bake:ok_rainbow",
]
