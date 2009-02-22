module AmuseHelpers
	
	def authors
		new_info = {:name => '', :nickname => '', :email => ''}; @author = Hash.new
		# unless $conf[:author].nil?
		# 			authors_list = serial_read(:authors)
		# 			unless authors_list.first.empty?
		# 				new_info = authors_list.select { |a| a[:id] == $conf[:author] }.first
		# 			end
		# 		end
		layout do
			flow do
				colorContent('Name:', red)
        @author[:name] = edit_line(new_info[:name], :margin => 15)
			end
			flow do
				colorContent('Nickname:', red)
        @author[:nickname] = edit_line(new_info[:nickname], :margin => 15)
			end
			flow do
				colorContent('Email:', red)
        @author[:email] = edit_line(new_info[:email], :margin => 15)
			end
			flow do
        button('cancel', :margin => 15) { clear; admin }
        button('Done', :margin => 15) { new_info[:name] = @author[:name].text
																				new_info[:nickname] = @author[:nickname].text
																				new_info[:email] = @author[:email].text
																				store_author(new_info); clear; admin }
      end
		end
		@title.replace "Edit Author"
		@display.replace "infos:"
	end
	
	private
	
	def store_author(author_hash)
		if author_hash[:id].nil?
			$conf[:author] = serial_write(:authors,:new,author_hash).to_i
		else
			$conf[:author] = serial_write(:authors,:update,author_hash).to_i
		end
	end
	
end