module AmuseHelpers
	
	def greetings
		if $conf[:server].nil?
			alert("Please define your server before the fun starts!!")
			clear; admin
		else
			layout do
				button("START", :margin => 10) { clear; dashboard }
			end
			@title.replace "Bienvenido!!"
			@display.replace "Welcome to Amuse!!!"
		end
	end
	
end