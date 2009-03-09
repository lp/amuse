# Author:: lp (mailto:lp@spiralix.org)
# Copyright:: 2009 Louis-Philippe Perron - Released under the terms of the MIT license
# 
# :title:Amuse

class Amuse < Shoes
	require 'yaml'
	@@localdir = File.dirname( File.expand_path(__FILE__))
	%w[admin authors crypt connect dashboard greetings files keys layout messages projects threads serial_reader serial_writer].each do |file|
		require File.join( @@localdir, 'lib', file)
	end
	include AmuseHelpers
	
	$runtime = Hash.new
	$conf_path = 'amuse.conf'
	$conf = YAML::load( File.open($conf_path,'r').read)
	
	$server = Hash.new
	url '/', :greetings
	url '/admin', :admin
	url '/connect', :connect
	d = :dashboard; url "/#{d.to_s}", d
		$server[d] = { :r => "cache/#{d.to_s}", :w => "app/#{d.to_s}"}
	f = :files; url "/#{f.to_s}", f
		$server[f] = { :r => "#{f.to_s}/", :w => "app/#{f.to_s}"}
	m = :messages; url '/m.to_s', m
		$server[m] = { :r => "cache/projects/", :w => "app/#{m.to_s}"}
	a = :authors; url "/#{a.to_s}", a
		$server[a] = { :r => "cache/#{a.to_s}", 	:w => "app/#{a.to_s}"}
	p = :projects; url "/#{p.to_s}", p
		$server[p] = { :r => "cache/#{p.to_s}", 	:w => "app/#{p.to_s}"}
	t = :threads; url "/#{t.to_s}", t
		$server[t] = { :r => "cache/projects/", 	:w => "app/#{t.to_s}"}
	
end
Shoes.app :title => 'Amuse', :width => 600, :height => 720
