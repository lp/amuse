# Author:: lp (mailto:lp@spiralix.org)
# Copyright:: 2009 Louis-Philippe Perron - Released under the terms of the MIT license
# 
# :title:AmuseHelpers
module AmuseHelpers
	require 'yaml'
	require 'net/http'
	require 'uri'
	
	def serial_write(grade,operation,object)
		Crypt.decrypt(
			Net::HTTP.post_form(
				URI.parse( "http://#{$conf[:server]}/#{$server[grade][:w]}/#{operation.to_s}"),
					{ :o => Crypt.encrypt( YAML::dump( object)) }).body.chomp)
	end
	
end