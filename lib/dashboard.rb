module AmuseHelpers
	
	def dashboard
		layout do
			flow do
				button("Files", :margin => 10) { clear; files }
				button("Messages", :margin => 10) { clear; messages }
				button("Admin", :margin => 10) {clear; admin}
			end
		end
		@title.replace "Dashboard"
		@display.replace "Connecting to Server..."
		@dashboard = serial_read(:dashboard)
		@display.replace @dashboard.inspect
	end
	
end