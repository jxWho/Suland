require 'test/unit'
require 'shoulda'
require_relative '../lib/suland'

class TestUtils < Test::Unit::TestCase

	def equalHash( hash1, hash2 )
		hash1.each_key do |key|
				return false unless hash1[key].class == hash2[key].class

			if hash1[key].is_a?( Hash ) and hash2[key].is_a?( Hash )
				return false unless equalHash( hash1[key], hash2[key] ) == true

				next
			end

			return false unless hash1[key] == hash2[key]
		end

		return true
	end

	context "test merge hash utility" do
		origin_hash = {
			"c" => 1,
			"hash" => {
				"a" => 2,
				"k" => 5
			}
		}

		override_hash = {
			"d" => 2,
			"c" => 4,
			"hash" => {
				"a" => 3,
				"b" => 4
			}
		}

		result_hash = {
			"c" => 4,
			"d" => 2,
			"hash" => {
				"a" => 3,
				"b" => 4,
				"k" => 5
			}
		}


		should "equal to the result_hash" do
			testHash = Suland::Utils.mergeHashes( origin_hash, override_hash )
			puts result_hash
			assert_block {
				equalHash( testHash, result_hash )
			}
		end
	end
	
	
end