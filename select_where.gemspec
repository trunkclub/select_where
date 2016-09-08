# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "select_where"
  spec.version       = "1.0.0"
  spec.authors       = ["Trunkclub"]
  spec.email         = ["nickm@trunkclub.com"]
  spec.description   = "extends ruby array with select helpers"
  spec.summary       = "extends ruby array with select helpers"
  spec.homepage      = ""
  spec.license       = "none"

  spec.files         = `git ls-files`.split($/)
  spec.bindir        = 'bin'
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "byebug"
  spec.add_development_dependency "pry"
  spec.add_development_dependency "pry-debugger"
  spec.add_development_dependency "simplecov", "~> 0.12"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 3"
end
