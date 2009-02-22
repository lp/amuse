module AmuseHelpers
	
	def messages
		thread = serial_read(:messages,'1/',1)
		layout do
			stack do
				unless thread.first.empty?
					thread.each do |t|
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
				@subject = edit_line
				@message = edit_box
			end
			button("Submit", :margin => 10) { store_message({:author_id => $conf[:author],
																													:project_id => 1,
																													:thread_id => 1,
																													:title => @subject.text,
																													:message => @message.text })
																						clear; messages }
			button("Dashboard", :margin => 10) { clear; dashboard}
		end
		@title.replace "Messages"
	end
	
	private
	
	def store_message(message_hash)
		serial_write(:messages,:new,message_hash)
	end
	
end