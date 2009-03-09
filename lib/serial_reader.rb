# Author:: lp (mailto:lp@spiralix.org)
# Copyright:: 2009 Louis-Philippe Perron - Released under the terms of the MIT license
# 
# :title:AmuseHelpers
module AmuseHelpers
	require 'yaml'
	require 'net/http'
	require 'uri'
	
	def serial_read(author_id,key,grade,id1='',id2='')
		YAML::load(
			Crypt.decrypt(
				Net::HTTP.post_form(
					URI.parse("http://#{$conf[:server]}/#{$server[grade][:r]}#{id1}#{id2}.cache"),
						{ :a => author_id, :k => key}).body))
	end

end