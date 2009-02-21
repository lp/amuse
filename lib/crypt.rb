module AmuseHelpers
	require 'openssl'
	require 'yaml'
	
	def encrypt(data)
		c = OpenSSL::Cipher::Cipher.new("bf-cbc")
		c.encrypt; c.key = $conf[:key]; c.iv = $conf[:iv]
		e = c.update(data); e << c.final
		e
	end
	
	def decrypt(data)
		c = OpenSSL::Cipher::Cipher.new("bf-cbc")
		c.decrypt; c.key = $conf[:key]; c.iv = $conf[:iv]
		d = c.update(data); d << c.final
		d
	end
	
end