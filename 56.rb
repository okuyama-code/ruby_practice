require 'digest'

p "MD5:  " + Digest::MD5.hexdigest("aaa")
p Digest::SHA256.hexdigest("aaa")
p Digest::SHA512.hexdigest("aaa")
