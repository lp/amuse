module AmuseHelpers
	require 'yaml'
	require 'net/http'
	require 'uri'
	
	def serial_read(grade,id1='',id2='')
		@display.replace 'Fetching cached data '
		YAML::load(
			decrypt(
				Net::HTTP.get(
					URI.parse("http://#{$conf[:server]}/#{$server[grade][:r]}#{id1}#{id2}.cache")
				).chomp))
	end

end