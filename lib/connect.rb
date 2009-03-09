# Author:: lp (mailto:lp@spiralix.org)
# Copyright:: 2009 Louis-Philippe Perron - Released under the terms of the MIT license
# 
# :title:AmuseHelpers
module AmuseHelpers
	
	def connect(origin='greetings',block=nil)
		layout do
			stack :top => 100, :left => 40 do
				stroke black; fill gainsboro
				rect :width => 480, :height => 360, :curve => 20
				# button "cancel", :top => 300, :left => 400 { eval(origin) }
			end
		end
		@title.replace "Connect"
		block.call
	end
	
end