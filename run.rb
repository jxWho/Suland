require './lib/suland'

a = Suland::Generate.new( Suland::Configuration::DefaultSettings )
b = Suland::Render.new

 a.readPosts

a.posts.each do |e|
	print b.markdown e.content
 end