module AmuseHelpers
	require 'openssl'
	require 'yaml'
	
	File.open('amuse.conf','r') do |f|
		content = YAML::load(f.read)
		IV = content[:iv]
		KEY = content[:key]
	end
	
	def decrypt(data)
		c = OpenSSL::Cipher::Cipher.new("bf-cbc")
		c.decrypt; c.key = KEY; c.iv = IV
		d = c.update(data); d << c.final
		d
	end
	
end