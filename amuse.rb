# Author:: lp (mailto:lp@spiralix.org)
# Copyright:: 2009 Louis-Philippe Perron - Released under the terms of the MIT license
# 
# :title:Amuse

class Amuse < Shoes
	require 'yaml'
	require 'lib/admin'
	require 'lib/crypt'
	require 'lib/dashboard'
	require 'lib/greetings'
	require 'lib/files'
	require 'lib/messages'
	require 'lib/serial_reader'
	include AmuseHelpers
	
	$conf = YAML::load( File.open('amuse.conf','r').read)
	
	$server = Hash.new
	url '/', :greetings
	url '/admin', :admin
	d = :dashboard; url "/#{d.to_s}", d
		$server[d] = { :r => "cache/#{d.to_s}", :w => "app/#{d.to_s}"}
	f = :files; url "/#{f.to_s}", f
		$server[f] = { :r => "#{f.to_s}/", :w => "app/#{f.to_s}"}
	m = :messages; url '/messages', m
		$server[m] = { :r => "cache/#{m.to_s}/", :w => "app/#{m.to_s}"}
	a = :authors
		$server[a] = { :r => "cache/#{a.to_s}", 	:w => "app/#{a.to_s}"}
	p = :projects
		$server[p] = { :r => "cache/#{p.to_s}", 	:w => "app/#{p.to_s}"}
	t = :threads
		$server[t] = { :r => "cache/#{t.to_s}/", 	:w => "app/#{t.to_s}"}
	
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
