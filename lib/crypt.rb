# Author:: lp (mailto:lp@spiralix.org)
# Copyright:: 2009 Louis-Philippe Perron - Released under the terms of the MIT license
# 
# :title:AmuseHelpers
module Crypt
	require 'openssl'
	require 'yaml'
	
	def Crypt.encrypt(data)
		c = OpenSSL::Cipher::Cipher.new("bf-cbc")
		c.encrypt; c.key = $conf[:key]; c.iv = $conf[:iv]
		e = c.update(data); e << c.final
		e
	end
	
	def Crypt.decrypt(data)
		c = OpenSSL::Cipher::Cipher.new("bf-cbc")
		c.decrypt; c.key = $conf[:key]; c.iv = $conf[:iv]
		d = c.update(data); d << c.final
		d
	end
	
end