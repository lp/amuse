module AmuseHelpers
	
	def dashboard
		layout do
			flow do
				button("Files", :margin => 10) { clear; files }
				button("Messages", :margin => 10) { clear; messages }
			end
		end
		@title.replace "Dashboard"
		@display.replace "Connecting to Server..."
		download "http://amuse.spiralix.org/app/projects" do |data|
			@display.replace YAML::load(decrypt(data.response.body)).inspect
		end
	end
	
end