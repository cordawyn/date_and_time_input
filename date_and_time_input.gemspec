Gem::Specification.new do |gem|
  gem.name        = 'date_and_time_input'
  gem.authors     = ['Slava Kravchenko']
  gem.email       = ['slava.kravchenko@gmail.com']
  gem.version     = ("$Release: 0.0.2 $" =~ /[\.\d]+/) && $&
  gem.platform    = Gem::Platform::RUBY
  gem.homepage    = "https://github.com/cordawyn/date_and_time_input"
  gem.summary     = "Rails extension for Datetime 2-field inputs"
  gem.description = <<HERE
DateAndTimeInput is a Rails extension, providing a form input for DateTime attributes
arranged as two input fields, for date and time, respectively.
HERE

  gem.files         = `git ls-files`.split($\) - ["Gemfile.lock"]
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency "actionpack", "~> 3.2.0"

  gem.license = "The MIT License (MIT)"
  gem.extra_rdoc_files = ['README.md']
  gem.has_rdoc = false
end
