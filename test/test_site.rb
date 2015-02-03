require 'test/unit'
require 'shoulda'
require 'pathname'
require_relative "../lib/suland"

class TestSite < Test::Unit::TestCase

	context "Test Site Class" do

		should "return 2015/01/25/post1/" do
			result = '2015/01/25/post1/'
			testParams = ["2015", "01", "25", "post1"]
			testInstance = Suland::Site.new( "root", testParams )
			assert_true( testInstance.permanLink.eql?( result ) )
		end

		should "create a folder" do
			testParams = ["2015", "01", "25", "post1"]

			root = File.dirname( File.expand_path( __FILE__ ) )
			testInstance = Suland::Site.new root, testParams
			testPost = OpenStruct.new
			testPost.content = "test post"
			testInstance.post = testPost
			testInstance.createFolderAndPost

			filePath = File.join( root, testInstance.permanLink )

			assert_true Dir.exist?( filePath )
		end

	end

end
