# encoding: UTF-8
require 'rdiscount'

module Suland

	class Generate

		attr_reader :root
		attr_accessor :posts

		def initialize( config )
			# get the top-level folder
			@config = config.clone
			@root = File.expand_path( config['root'] ).freeze

			@posts ||= []
		end

		def setup

			if File.exist?("#{@root}/product")
				puts "Product folder already exists. Delete it"
				Dir.rmdir( "#{@root}/product" )
			end

			# create the directory to put generated files
			Dir.mkdir("#{@root}/product")
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
					@posts << newPost
				end
			end

		end # end readPosts

	end # end class

end # end module