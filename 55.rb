require 'securerandom'

p SecureRandom.uuid.tr("-", "")
p SecureRandom.alphanumeric(10)
