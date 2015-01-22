# encoding: UTF-8
module Suland

	class Post < OpenStruct

		attr_reader	:metadata, :content

		def initialize( content )
			_, @metadata, @content = content.split('---', 3)

			@metadata = OpenStruct.new( YAML.load( @metadata ) )
		end
	end
end