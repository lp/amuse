# Author:: lp (mailto:lp@spiralix.org)
# Copyright:: 2009 Louis-Philippe Perron - Released under the terms of the MIT license
# 
# :title:AmuseHelpers
module AmuseHelpers
	
	def greetings
		if $conf[:server].nil?
			alert("Please define your server before the fun starts!!")
			clear; admin
		else
			layout(:scroll => true) do
				stroke black; fill darkgray
				rect :top => 120, :left => 110, :width => 340, :height => 260, :curve => 20
				button("START", :top => 340, :left => 350) { clear; dashboard }
			end
			@title.replace "Login"
		end
	end
	
end