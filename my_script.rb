load 'vigenere.rb'

vigener_encrypter = Vigenere.new('key', 'angewandteinformatik')
AMOUNT = vigener_encrypter.analyze_char_amount

puts "#{AMOUNT}"
