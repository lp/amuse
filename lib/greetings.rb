module AmuseHelpers
	
	def greetings
		layout do
			button("START", :margin => 10) { clear; dashboard }
		end
		@title.replace "Bienvenido!!"
		@display.replace "Welcome to Amuse!!!"
	end
	
end