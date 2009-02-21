module AmuseHelpers
	require 'yaml'
	require 'net/http'
	require 'uri'
	
	def serial_read(grade,id='')
		@display.replace 'Fetching cached data '
		YAML::load(
			decrypt(
				Net::HTTP.get(
					URI.parse("http://127.0.0.1:4567/#{$server[grade][:r]}#{id}.cache")
				).chomp))
	end

end