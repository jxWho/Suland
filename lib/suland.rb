#use when no gem ( bascially there's no )
$:.unshift File.dirname(__FILE__)

module Suland
	# internal requires
	autoload :Configuration, "suland/configuration"
	autoload :Generate, "suland/generate"
	autoload :Post, 'suland/post'

	# external requires
	require 'ostruct'
	require 'yaml'
end