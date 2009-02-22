module AmuseHelpers
	
	def projects
		@project = Hash.new
		layout do
			stack do
				colorContent('Project Name:', white)
				@project[:name] = edit_line('', :margin => 15)
				colorContent('Project Description:', white)
				@project[:description] = edit_line('', :margin => 15)
			end
			flow do
        button('cancel', :margin => 15) { clear; dashboard }
        button('Done', :margin => 15) { new_project = {}; new_project[:name] = @project[:name].text
																				new_project[:description] = @project[:description].text
																				store_project(new_project); clear; dashboard }
      end
		end
		@title.replace "Projects"
		@display.replace "New Project:"
	end
	
	private
	
	def store_project(project_hash)
		serial_write(:projects,:new,project_hash)
	end
	
end