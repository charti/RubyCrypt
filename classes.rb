# This Class implements the Vigenere encryption
class Vigenere

  public
# @param [String] key
	# Represents the encryption key
# @param [String] context
	# not encrypted
# @return [String]
	# returns encoded context
	def initialize(key=nil, context=nil)
		size_alphabet
    if key.kind_of?(String) && context.kind_of?(String)
      @key = key.downcase
      @context = context.downcase
    else
      @key = String.new
			@context = String.new
    end
    @encode = String.new
		encode
  end

  public
# @param [String] key
	# used for encryption
# @param [String] context
	# clear type text
# @return [String]
	# encoded context
	def encode(key=nil, context=nil)
		if key.kind_of?(String) && context.kind_of?(String)
			@key = key.downcase
			@context = context.downcase
		end
		array = Array.new
		@context.scan(/./).each_with_index do |char, i|
			shift    = ((char.ord - 97) + (@key[i % @key.length].ord - 97)) % @alphabetCount
			array[i] = (97 + shift).chr
		end
		@encode = array.to_s
	end

# @param [Integer] size
	# sets the alphabet size
# @return [Integer] Alphabet size
	# returns the alphabet count
	public
	def size_alphabet(size = 26)
		@encode = nil unless (@alphabetCount == 26)
		@alphabetCount = size.abs
	end
end