# Author:: lp (mailto:lp@spiralix.org)
# Copyright:: 2009 Louis-Philippe Perron - Released under the terms of the MIT license
# 
# :title:Amuse

class Amuse < Shoes
	require 'lib/admin'
	require 'lib/crypt'
	require 'lib/dashboard'
	require 'lib/greetings'
	require 'lib/files'
	require 'lib/messages'
	include AmuseHelpers
	
	U = Hash.new
	url '/', :greetings
	url '/admin', :admin
	url '/dashboard', :dashboard;		U[:dashboard] = { :r => 'cache/dashboard', :w => 'app/dashboard'}
	url '/files', :files;						U[:files] = { :r => 'files/', :w => 'app/files'}
	url '/messages', :messages;			U[:messages] = { :r => 'cache/messages/', :w => 'app/messages'}
																	U[:authors] = { :r 'cache/authors', :w => 'app/authors'}
																	U[:projects] = { :r => 'cache/projects', :w => 'app/projects'}
																	U[:threads] = { :r => 'cache/threads', :w => 'app/threads'}
	private
  
  def layout
    background black
		stack(:height => 150) do
    	stack(:margin => 10) do
	      @title = title( '', 
	        :align => "center",
	        :font => "Trebuchet MS",
	        :stroke => pink
	      )
	    end
	    stack(:margin => 20) do
	        @display = para( '',
	          :size => 14, 
	          :align => "center", 
	          :font => "Trebuchet MS", 
	          :stroke => pink
	        )
			end
		end
		stack(:margin => 20) do
      yield if block_given?
			@quit = button('quit', :margin => 10) { exit }
    end
  end
  
  def colorContent(text,color)
    return para( text,
      :size => 12,
      :align => 'left',
      :margin => 15,
      :font => "Trebuchet MS",
      :stroke => color
    )
  end
	
end
Shoes.app :title => 'Amuse', :width => 500, :height => 700
