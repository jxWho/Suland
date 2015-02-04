# encoding: utf-8

module Suland
	class Site

		attr_reader :siteLayers, :root
		attr_accessor :post

		# root - the parent path of the folder
		#
		# layers - store all the layer names of a folder to be created
		# ex. [2015, 03, 17, bb] leads to a folder - root/2015/03/17/bb/
		def initialize( root, layers )
			# make a deep copy of the `layers`
			@siteLayers = layers.clone
			@root = root
		end

		def permanLink
			result = ""
			@siteLayers.each { |layer|
				result = result + layer.to_s + '/'
			}
			result
		end

		def createFolderAndPost
			raise "This site has no post" if @post.nil?

			folderPath = File.join root.to_s, self.permanLink
			#raise "Target folder exist" if Dir.exist?( folderPath )
			# delete the folder if exists
			FileUtils.remove_dir( folderPath ) if Dir.exist?( folderPath )
			FileUtils.mkdir_p folderPath
			File.open( File.join(folderPath, "index.html"), "w" ) { |file|
				file << @post.content
			}
		end

	end # site
end
