require 'test/unit'
require 'shoulda'
require_relative "../lib/suland"

class TestConfiguration < Test::Unit::TestCase

	context "test read `YAML file` " do
		should "return the correct hash" do
			testFile = File.expand_path( '../', __FILE__ )
			testFile = File.join( testFile, 'test_files/conf1.yaml')

			configurationInstance = Suland::Configuration.new
			finalHash = configurationInstance.readFile( testFile )

			assert_equal( finalHash["a"], 1 )
			assert_equal( finalHash["b"], 2 )
			assert_equal( finalHash["c"], 3 )
		end
	end
end