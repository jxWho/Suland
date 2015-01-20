require 'sinatra/base'
#require "ostruct"
require "time"
require 'yaml'
require 'rdiscount'

class Blog < Sinatra::Base
  # File.expand_path generates an absoulte path
  # It also takes a path as second argument. The
  # generated path is treated as beging relative
  # to the path

  set :root, File.expand_path('../../', __FILE__)
  set :articles, []
  set :app_file, __FILE__

  Dir.glob( "#{root}/_posts/*.md" ) do |file|
  	# parse meta and contetn from file
  	# use
  	#  ---
  	#  ---
  	#  to mark metadata
  	_, meta, content = File.read(file).split('---', 3)
  	# regular expression to remove leading & trailing space
  	pattern = /^\S[\s\S]*\S$/
  	match = pattern.match( meta )
  	meta = match[0]

  	#meta, content = File.read(file).split( "\n\n", 2 )
  	print "\n\n\n\n\n"
  	print "#{meta}, #{content}"

  	# generate a metadata object
  	article = OpenStruct.new( YAML.load( meta ) )

  	# convert the date to a time object
    if article.date
      article.date = Time.parse( article.date.to_s )
    end

  	# add the content
  	article.content = content

  	# generate a slug for the url
  	article.slug = File.basename( file, '.md' )

  	# set up the route
  	get "/#{article.slug}" do
  		erb :post, :locals=>{ :article => article }
  	end

  	# Add article to list of articles
  	articles << article
  end

  # Sort articles by date, display new articles first
  articles.sort_by! { |article| article.date }

  articles.reverse!

  get '/' do
  	erb :index
  end
end
