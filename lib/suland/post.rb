# encoding: UTF-8
module Suland

	class Post < OpenStruct

		attr_reader	:metadata, :content

		attr_accessor :site, :render

		def initialize( content, site, configuration, fName )
			_, @metadata, @content = content.split('---', 3)

			@metadata = OpenStruct.new( YAML.load( @metadata ) )

			@permalinkFormat = configuration.permalinkFormat
			@site = site
			@fileName[:year], @fileName[:month], @fileName[:day],
			@fileName[:title] = fName.split( '-' )

			permalinkFormat = configuration.permalinkFormat
			permalinkFormat = permalinkFormat.split('/')
			layers = []

			permalinkFormat.each { |value|
				layers << @fileName[ value.to_sym ]
			}

			postRoot =
				File.join(
				configuration["destination"], configuration["productPost"] )

			newSite = Suland::Site.new postRoot, layers
			newSite.post = self # site point back to this post

		end # end initialize

		def writePostToFile
			@content = Suland::Render.markdown @content
			raise "Site is not set properly" if @site.nil?
			site.createFolderAndPost
		end
	end
end
