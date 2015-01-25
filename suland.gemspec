# encoding: utf-8
Gem::Specification.new do |s|
	s.name = "suland"
	s.summary = "simple engine to help generate static files"
	s.description = File.read( File.join( File.dirname(__FILE__), 'README.md'))
	s.version = "0.0.1"
	s.author = ["Jiaxiang Hu"]
	s.homepage = "https://github.com/jxWho/Suland"
	s.platform = Gem::Platform::RUBY
	s.required_ruby_version = '>=2.2.0'
	s.files = Dir['**/**']

	all_files = `git ls-files -z`.split("\x0")
	s.executables = all_files.grep( %r{^[bin|lib]/} )
	s.require_paths = ['lib']

	s.test_files = Dir["test/test*.rb"]

	s.has_rdoc = false

	s.add_runtime_dependency('tilt', '~> 2.0.1')
end