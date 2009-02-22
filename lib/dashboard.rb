module AmuseHelpers
	
	def dashboard
		@dashboard = serial_read(:dashboard)
		layout do
			stack do
				unless @dashboard.first.empty?
					@dashboard.each do |t|
						para( t[:title],
		          :size => 14, 
		          :align => "Left", 
		          :font => "Trebuchet MS", 
		          :stroke => red
		        )
						para( t[:message],
		          :size => 12, 
		          :align => "left", 
		          :font => "Trebuchet MS", 
		          :stroke => white
		        )
					end
				end
			end
			flow do
				button("Files", :margin => 10) { clear; files }
				button("Messages", :margin => 10) { clear; messages }
				button("Admin", :margin => 10) {clear; admin}
			end
		end
		@title.replace "Dashboard"
		@display.replace "Recent Messages:"
	end
	
end