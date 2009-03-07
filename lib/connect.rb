module AmuseHelpers
	
	def connect(author_id=nil,&block)
		layout do
			button("cancel")
		end
		block.call
	end
	
end