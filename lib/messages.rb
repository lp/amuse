module AmuseHelpers
	
	def messages
		@current_thread = 1 if @current_thread.nil?
		thread = serial_read(:messages,"#{@current_project.to_s}/",@current_thread)
		@threads = serial_read(:threads,@current_project)
		layout do
			stack do
				colorContent('Threads:', white)
				unless @threads.first.empty?
					flow do
						colorContent('Subjects:', white)
					end
					@threads.each do |p|
						flow do
							para( p[:subject],
			          :size => 12, 
			          :align => "Left", 
			          :font => "Trebuchet MS", 
			          :stroke => red
			        )
							button("Go!", :margin => 10) { @current_thread = p[:id]; clear; messages }
						end
					end
				end
				button("New Thread", :margin => 10) { clear; threads }
			end
			stack do
				unless thread.first.empty?
					thread.each do |t|
						colorContent('Title:', white)
						para( t[:title],
		          :size => 14, 
		          :align => "Left", 
		          :font => "Trebuchet MS", 
		          :stroke => red
		        )
						colorContent('Message:', white)
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
																													:project_id => @current_project,
																													:thread_id => @current_thread,
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