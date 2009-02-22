module AmuseHelpers
	
	def messages
		layout do
			button("Dashboard", :margin => 10) { clear; dashboard }
		end
		@title.replace "Messages"
		@display.replace "(in development...)"
		
	end
	
end