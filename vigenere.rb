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
		@context.scan(/./).each_with_index do |char, i|
			shift    = ((char.ord - 97) + (@key[i % @key.length].ord - 97)) % @alphabet_count
			@encode += (97 + shift).chr
		end
		@encode
	end

# @param [Integer] size
	# sets the alphabet size
# @return [Integer] Alphabet size
	# returns the alphabet count
	public
	def size_alphabet(size = 26)
		@encode = nil unless (@alphabet_count == 26)
		@alphabet_count = size.abs
	end

	public
# @return [Hash] Amount of char appereance
	def analyze_char_amount
		char_amount = Hash.new
		if @encode != nil
			@encode.each_char do |char|
				char_amount.key?(char) ? char_amount[char] += 1 : char_amount[char] = 1
			end
		end
		char_amount
	end
end