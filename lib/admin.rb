# Author:: lp (mailto:lp@spiralix.org)
# Copyright:: 2009 Louis-Philippe Perron - Released under the terms of the MIT license
# 
# :title:AmuseHelpers
module AmuseHelpers
	def admin
		layout do
			unless $conf[:server].nil?
				flow do
	        colorContent('Local Author: ', red)
					authors_list = serial_read(:authors)
	        @type = list_box :items => authors_list.map { |a| a[:nickname]},
	          :margin => 15,
	          :width => 120,
	          :choose => authors_list.select { |a| a[:id] == $conf[:author] }.first[:nickname] do |list|
	            $conf[:author] = authors_list.select { |a| a[:nickname] == list.text }.first[:id]
	          end
					button('New Author', :margin => 15) { clear; authors }
	      end
			end
			flow do
				colorContent('Server:', red)
        @server = edit_line($conf[:server], :margin => 15)
			end
      flow do
        button('cancel', :margin => 15) { clear; dashboard }
        button('Done', :margin => 15) { $conf[:server] = @server.text
																					store_conf; clear; dashboard }
      end
		end
		@title.replace "Administration"
		@display.replace "Change only something if you know what you are doing!!"
	end
	
	private
	
	def store_conf
		File.open($conf_path,'w') do |file|
			file.puts( YAML::dump( $conf))
		end
	end
	
end