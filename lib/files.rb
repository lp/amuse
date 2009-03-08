# Author:: lp (mailto:lp@spiralix.org)
# Copyright:: 2009 Louis-Philippe Perron - Released under the terms of the MIT license
# 
# :title:AmuseHelpers
module AmuseHelpers
	require 'digest'
	require 'httpclient'
	require 'net/http'
	require 'uri'
	
	def files
		layout do
			button("Upload...", :margin => 10) { put_file }
			button("Dashboard", :margin => 10) { clear; dashboard }
		end
		@title.replace "Files"
		@display.replace "(in development...)"
	end
	
	private

	# def get_file
	# 		@display.replace "Connecting to server..."
	# 		download "http://amuse.spiralix.org/files/proj/dummy.txt" do |file|
	# 			@display.replace "was: #{file.response.body}"
	# 		end
	# 	end
	
	def put_file
		uri = URI.parse('http://amuse.spiralix.org/upload/new/goo/bogus.pdf')
		path = 'bogus.pdf'; block_size = 2097152; done = 0
		digest = Digest::SHA1.digest(path)
		File.open(path,'r') do |file|
			while part = file.read(block_size)
				done += 1; body = { 'upload' => part, 'part' => done, 'digest' => digest}
			  HTTPClient.new.post_content(uri, body, {'Content-Type' => 'multipart/form-data'})
			end
		end
		@display.replace "Done!!!"
	end
	
end