# Author:: lp (mailto:lp@spiralix.org)
# Copyright:: 2009 Louis-Philippe Perron - Released under the terms of the MIT license
# 
# :title:Keys
class Keys
	require 'yaml'
	require 'net/http'
	require 'uri'
	require File.join( File.dirname( File.expand_path(__FILE__)), 'crypt')
	
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
			Crypt.decrypt(
				Net::HTTP.post_form(
					URI.parse( "http://#{$conf[:server]}/auth"),
						{ :a => 'ipkey' }).body.chomp)
		response = Keys.do_challenge(challenge)
		key = Crypt.decrypt(
			Net::HTTP.post_form(
				URI.parse( "http://#{$conf[:server]}/auth"),
					{ :a => 'ipkey', :r => Crypt.encrypt( response) }).body.chomp)
	end
	
	def Keys.get
		challenge = YAML::load(
			Crypt.decrypt(
				Net::HTTP.post_form(
					URI.parse( "http://#{$conf[:server]}/auth"),
						{ :a => $runtime[:author][:id] }).body.chomp))
		response = do_challenge(challenge)
		@@keys = YAML::load(
			Crypt.decrypt(
				Net::HTTP.post_form(
					URI.parse( "http://#{$conf[:server]}/auth"),
						{ :a => 'ipkey', :r => Crypt.encrypt( response) }).body.chomp))		
	end
	
	def Keys.do_challenge(challenge)
		eval(challenge[1].to_s+challenge[0]+challenge[2].to_s).to_s
	end
	
	
end