# Author:: lp (mailto:lp@spiralix.org)
# Copyright:: 2009 Louis-Philippe Perron - Released under the terms of the MIT license
# 
# :title:AmuseHelpers
module AmuseHelpers
	
	def greetings
		debug("greetings")
		login = Hash.new
		if $conf[:server].nil?
			alert("Please define your server before the fun starts!!")
			clear; admin
		else
			layout(:scroll => true) do
				stack :top => 120, :left => 110 do
					stroke black; fill darkgray
					rect :width => 340, :height => 260, :curve => 20
					stack :top => 40, :left => 30 do
						stroke black; fill dimgray
						rect :width => 280, :height => 40, :curve => 3
						stack :top => 5, :left => 5 do
							para 'Author: ', :size => 16, :font => "Trebuchet MS", :stroke => red
						end
						stack :top => 5, :left => 80 do
							login[:author] = edit_line($conf[:author], :width => 180)
						end
					end
					stack :top => 130, :left => 30 do
						stroke black; fill dimgray
						rect :width => 280, :height => 40, :curve => 3
						stack :top => 5, :left => 5 do
							para 'Server: ', :size => 16, :font => "Trebuchet MS", :stroke => red
						end
						stack :top => 5, :left => 80 do
							login[:server] = edit_line($conf[:server], :width => 180)
						end
						stack
					end
					button("START", :top => 220, :left => 240) {  $conf[:author] = login[:author].text
																												$conf[:server] = login[:server].text
																												store_conf
																												clear
																												connect('greetings',logon) }
				end
			end
			@title.replace "Login"
		end
	end
	
	private
	
	def logon
		lambda {
			debug 'greetings block'
			key = Keys.temp
			authors_list = serial_read('ipkey',key,:authors)
			selected = authors_list.select { |a| $conf[:author] =~ /#{a[:name]}|#{a[:nickname]}/i}
			if selected.empty?
				alert("You need to register as an Author First!!!")
				clear; authors
			else
				$runtime[:author] = selected.first
				Keys.get; clear; dashboard
			end
		}
	end
	
end