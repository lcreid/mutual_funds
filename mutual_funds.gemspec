# frozen_string_literal: true

require_relative "lib/mutual_funds/version"

Gem::Specification.new do |spec|
  spec.name          = "mutual_funds"
  spec.version       = MutualFunds::VERSION
  spec.authors       = ["Larry Reid"]
  spec.email         = ["lcreid@jadesystems.ca"]

  spec.summary       = "BOGON"
  spec.description   = "BOGON"
  spec.homepage      = "https://jadesystems.ca"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://jadesystems.ca"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "httparty", "~> 0.20"
  spec.add_dependency "nokogiri"

  # For more information and exampdules about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
end
