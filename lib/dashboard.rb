module AmuseHelpers
	
	def dashboard
		@dashboard = serial_read(:dashboard)
		@projects = serial_read(:projects)
		layout do
			stack do
				colorContent('Projects:', white)
				unless @projects.first.empty?
					flow do
						colorContent('Name:', white)
						colorContent('Description:', white)
					end
					@projects.each do |p|
						flow do
							para( p[:name],
			          :size => 12, 
			          :align => "Left", 
			          :font => "Trebuchet MS", 
			          :stroke => red
			        )
							para( p[:description],
			          :size => 10, 
			          :align => "left", 
			          :font => "Trebuchet MS", 
			          :stroke => blue
			        )
							button("Go!", :margin => 10) { @current_project = p[:id]; clear; messages }
						end
					end
				end
				button("New Project", :margin => 10) { clear; projects }
			end
			stack do
				unless @dashboard.first.empty?
					@dashboard.each do |t|
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
			end
			flow do
				button("Files", :margin => 10) { clear; files }
				button("Messages", :margin => 10) { clear; messages }
				button("Admin", :margin => 10) {clear; admin}
			end
		end
		@title.replace "Dashboard"
	end
	
end