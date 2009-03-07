module AmuseHelpers
	require 'digest'
	require 'httpclient'
	require 'net/http'
	require 'uri'
	
	def files
		layout do
			# button("Download...", :margin => 10) { get_file }
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
	
	# def put_file
	# 							@display.replace "putting file..."
	# 							uri = URI.parse('http://amuse.spiralix.org/app/files/new/big/bogus.pdf')
	# 							Net::HTTP.start(uri.host,uri.port) do |http|
	# 								req = Net::HTTP::Put.new("#{uri.path}")
	# 								response = http.request( req, File.open('bogus.pdf','r').read)
	# 								@display.replace "response code: #{response.code} message: #{response.message} body: #{response.body}"
	# 							end
	# 						end
	
	def put_file
								uri = URI.parse('http://127.0.0.1:4567/upload/new/goo/Numerology2-2.0.0.dmg')
								path = 'Numerology2-2.0.0.dmg'; block_size = 2097152; done = 0
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