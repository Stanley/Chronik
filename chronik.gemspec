# encoding: utf-8

Gem::Specification.new do |s|
  s.name = 'chronik'
  s.version = '0.1.0'
  s.summary = 'Dates\' class parser'
  s.authors = 'Stanisław Wasiutyński'
  s.email = 'staszek.wasiutynski@gmail.com'
  s.add_dependency 'unicode', '0.4.0'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'cucumber'
  s.files = Dir.glob('lib/**/*') + ['README.md']
  s.require_path = 'lib'
end
