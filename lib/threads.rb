module AmuseHelpers
	
	def threads
		@thread = Hash.new
		layout do
			stack do
				colorContent('Thread Subject', white)
				@thread[:subject] = edit_line('', :margin => 15)
			end
			flow do
				button('cancel', :margin => 15) { clear; messages }
				button('Done', :margin => 15) {new_thread = {:subject => @thread[:subject].text, :project_id => @current_project} 
																					store_thread(new_thread); clear; messages}
			end
		end
		@title.replace "Threads"
		@display.replace "New Thread:"
	end
	
	private
	
	def store_thread(thread_hash)
		serial_write(:threads,:new,thread_hash)
	end
	
end