# encoding: UTF-8
module Suland

	class Post < OpenStruct

		attr_reader	:metadata, :content

		attr_accessor :site, :render

		def initialize( content, configuration, fName )
			_, @metadata, @content = content.split('---', 3)

			@metadata = OpenStruct.new( YAML.load( @metadata ) )

			@site = site
			fName.match( /[\d]{4}-[\d]{2}-[\d]{2}-[^.]+/ )
			@fileName = {}
			@fileName[:year], @fileName[:month], @fileName[:day],
			@fileName[:title] = $~.to_a[0].split( '-', 4 )

			permalinkFormat = configuration["permalinkFormat"]
			permalinkFormat = permalinkFormat.split('/')
			layers = []

			permalinkFormat.each { |value|
				layers << @fileName[ value.to_sym ]
			}

			postRoot = configuration["destination"]

			newSite = Suland::Site.new( postRoot, layers )
			newSite.post = self # site point back to this post
			@site = newSite

		end # end initialize

		def writePostToFile
			@content = Suland::Render.markdown @content
			raise "Site is not set properly" if @site.nil?
			site.createFolderAndPost
		end
	end
end
