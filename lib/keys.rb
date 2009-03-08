# Author:: lp (mailto:lp@spiralix.org)
# Copyright:: 2009 Louis-Philippe Perron - Released under the terms of the MIT license
# 
# :title:Keys
class Keys
	require 'yaml'
	require 'net/http'
	require 'uri'
	require File.join( File.dirname( File.expand_path(__FILE__)), 'crypt')
	include AmuseHelpers
	
	@@keys = Array.new
	
	def Keys.use
		if @@keys.empty
			Keys.get
		else
			@@keys.shift
		end
	end
	
	def Keys.temp
		challenge = YAML::load(
			decrypt(
				Net::HTTP.post_form(
					URI.parse( "http://#{$conf[:server]}/auth"),
						{ :a => 'ipkey' }).body))
		response = Keys.do_challenge(challenge)
		key = decrypt(
			Net::HTTP.post_form(
				URI.parse( "http://#{$conf[:server]}/auth"),
					{ :a => 'ipkey', :r => encrypt( response) }).body))
	end
	
	def Keys.get
		challenge = YAML::load(
			decrypt(
				Net::HTTP.post_form(
					URI.parse( "http://#{$conf[:server]}/auth"),
						{ :a => $runtime[:author][:id] }).body))
		response = do_challenge(challenge)
		@@keys = YAML::load(
			decrypt(
				Net::HTTP.post_form(
					URI.parse( "http://#{$conf[:server]}/auth"),
						{ :a => 'ipkey', :r => encrypt( response) }).body))		
	end
	
	def Keys.do_challenge(challenge)
		eval(challenge[1].to_s+challenge[0]+challenge[2].to_s).to_s
	end
	
	
end