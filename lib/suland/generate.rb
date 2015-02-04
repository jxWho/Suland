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

			@posts = []
		end

		def process
			readPosts
			writePosts
		end

		# read origin posts from file
		# render them according to format
		def readPosts
			# match all the *.md files
			postSource = @config['postSource']
			pattern = /^[\S]*\.md$/.freeze
			postsFoladerPath = File.join( @root, postSource )
			Dir.foreach( postsFoladerPath ) do |fileName|
				match = pattern.match( fileName )
				if match
					postContent = File.read(
									File.join( postsFoladerPath, fileName ))
					newPost = Suland::Post.new( postContent, @config, fileName )
					@posts << newPost
				end
			end # end Dir.foreach


		end # end readPosts

		# write posts to file
		def writePosts
			@posts.each do |post|
				post.writePostToFile
			end
		end

	end # end class

end # end module
