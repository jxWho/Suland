# encoding: UTF-8
module Suland

	class Configuration < Hash
		# Default Settings
		DefaultSettings = {
			'root' =>	File.expand_path( "../../../", __FILE__ ),
			'destination' => File.join(
				File.expand_path( "../../../", __FILE__ ), '_site' )
		}
	end
end