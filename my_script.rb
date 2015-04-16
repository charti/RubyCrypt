load 'classes.rb'

TEXT = Vigenere.new('key', 'angewandteinformatik')
AMOUNT = TEXT.analyze_char_amount

puts "#{AMOUNT}"
