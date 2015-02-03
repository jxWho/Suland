# encoding: UTF-8
module Suland

	class Configuration < Hash
		# Default Settings
		DefaultSettings = {
			'root' => File.expand_path( "../../../", __FILE__ ),
			'destination' => File.join(
				File.expand_path( "../../../", __FILE__ ), '_site' ),
			'permalinkFormat' => 'year/month/date:/title',
			'productionPost' => '_post'
		}

		# public: Read the configuration from a file and merge with ths hash
		#
		# file - configuration file
		#
		# Returns the full configuration, default configuration will be
		# overriden by the values from this file
		def configurationFromFile( file )
			# return self as the final configuration object
			configuration = clone

			overrideConfiguration = readFile( file )

			return Utils.mergeHashes( configuration, overrideConfiguration )
		end

		# public: Read a file and return a hash structure
		#
		# file - file to read
		#
		# Returns a hash structure
		def readFile( file )
			content = File.read( file )
			content = YAML.load( content )
			content
		end

	end
end
