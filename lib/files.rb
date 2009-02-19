module AmuseHelpers
	
	def files
		layout do
			button("Download...", :margin => 10) { get_file }
			button("Dashboard", :margin => 10) { clear; dashboard }
		end
		@title.replace "Files"
		@display.replace "(in development...)"
	end
	
	private

	def get_file
		@display.replace "Connecting to server..."
		download "http://amuse.spiralix.org/files/proj/dummy.txt" do |file|
			@display.replace "was: #{file.response.body}"
		end
	end
	
end