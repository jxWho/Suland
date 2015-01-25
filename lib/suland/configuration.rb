# encoding: UTF-8
module Suland

	class Configuration < Hash
		# Default Settings
		DefaultSettings = {
			'root' =>	File.join( 
				File.expand_path( "../../../", __FILE__ ), 'source' ),
			'destination' => File.join(
				File.expand_path( "../../../", __FILE__ ), '_site' ),
		}

	end
end