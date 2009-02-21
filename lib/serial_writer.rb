module AmuseHelpers
	require 'yaml'
	require 'net/http'
	require 'uri'
	
	def serial_write(grade,operation,object)
		Net::HTTP.post_form(
			URI.parse( "http://#{$conf[:server]}/#{$server[grade][:w]}/#{operation.to_s}"),
				{ :o => encrypt( YAML::dump( object)) })
	end
	
end