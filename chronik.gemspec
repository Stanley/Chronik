Gem::Specification.new do |s|
  s.name = 'chronik'
  s.version = '0.1.1'
  s.summary = 'Date description parser'
  s.authors = 'Stanislaw Wasiutynski'
  s.email = 'staszek.wasiutynski@gmail.com'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'cucumber'
  s.files = Dir.glob('lib/**/*') + ['README.md']
  s.require_path = 'lib'
end
