# encoding: UTF-8
require 'rdiscount'

module Suland

	class Generate

		attr_reader :root
		attr_accessor :posts

		def initialize( configuration )
			# get the top-level folder
			@config = configuration.clone
			@root = File.expand_path( configuration['root'] ).freeze

			@posts ||= []
		end

		def readPosts
			# match all the *.md files
			pattern = /^[\S]*\.md$/.freeze
			postsFoladerPath = File.join( @root, "_posts" )
			Dir.foreach( postsFoladerPath ) do |fileName|
				match = pattern.match( fileName )
				if match
					postContent = File.read(
									File.join( postsFoladerPath, fileName ))
					newPost = Suland::Post.new postContent
					newPost.fileName = fileName
					@posts << newPost
				end
			end

		end # end readPosts

	end # end class

end # end module
