# Author:: lp (mailto:lp@spiralix.org)
# Copyright:: 2009 Louis-Philippe Perron - Released under the terms of the MIT license
# 
# :title:AmuseHelpers
module AmuseHelpers
	
	def connect(author_id=nil,&block)
		layout do
			button("cancel")
		end
		block.call
	end
	
end