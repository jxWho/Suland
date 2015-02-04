#use when no gem ( bascially there's no )
$:.unshift File.dirname(__FILE__)

module Suland
	# internal requires
	autoload :Configuration, "suland/configuration"
	autoload :Generate, "suland/generate"
	autoload :Post, 'suland/post'
	autoload :Render, 'suland/render'
	autoload :Base, 'suland/base'
	autoload :Utils, 'suland/utils'
	autoload :Site, 'suland/site'


	# stdlib dependencies
	require 'ostruct'
	require 'yaml'

	# external requires
	require "tilt"

	class << self
		def configuration
			configuration = Suland::Configuration::DefaultSettings
		end
	end
end