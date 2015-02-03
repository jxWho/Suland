require 'test/unit'
require 'shoulda'
require_relative "../lib/suland"

class TestRender < Test::Unit::TestCase

	context "Render markdown" do

		should 'return <h1>head</h1>\n' do
			data = "#head"
			output = Suland::Render.markdown( data )
			assert_equal "<h1>head</h1>\n", output
		end

	end
end
