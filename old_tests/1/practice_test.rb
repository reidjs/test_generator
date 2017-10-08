require 'byebug'
# Write a recursive method that takes in a string to search and a key string.
# Return true if the string contains all of the characters in the key
# in the same order that they appear in the key.
#
# string_include_key?("cadbpc", "abc") => true
# string_include_key("cba", "abc") => false
def string_include_key?(string, key)
  return true if string == key
  l = string.length
  k_l = key.length
  i = 0
  while i < (l - k_l)
    # return true if string[i ... i + k_l] == key
    return true if string_include_key?(string[i ... i+k_l], key)
    # val = string_include_key?(string[0 ... i], key)
    i += 1
  end
  false
end

class Array
  # Takes a multi-dimentional array and returns a single array of all the elements
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
  def my_flatten
    flattened = []
    self.each do |el|
      if el.is_a?(Array)
        flattened += el.my_flatten
      else
        flattened << el
      end
    end
    flattened
  end

  # Write a version of flatten that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,[5]]
  def my_controlled_flatten(n)
    flattened = []

    self.each do |el|
      depth = 0
      if el.is_a?(Array)
        depth += 1
        flattened += el.my_flatten
      else
        flattened << el
      end
    end
    flattened
  end
end

# Back in the good old days, you used to be able to write a darn near
# uncrackable code by simply taking each letter of a message and incrementing it
# by a fixed number, so "abc" by 2 would look like "cde", wrapping around back
# to "a" when you pass "z".  Write a function, `caesar_cipher(str, shift)` which
# will take a message and an increment amount and outputs the encoded message.
# Assume lowercase and no punctuation. Preserve spaces.
#
# To get an array of letters "a" to "z", you may use `("a".."z").to_a`. To find
# the position of a letter in the array, you may use `Array#find_index`.

def caesar_cipher(str, shift)
  shifted = ""
  words = str.split(" ")
  words.each do |word|
    word.each_char do |char|
      shifted += shift_char(char, shift)
    end
    shifted += " "
  end
  shifted[0...-1]
end

def shift_char(char, shift)
  alphabet = ('a'..'z').to_a
  idx = (alphabet.index(char) + shift) % alphabet.length
  alphabet[idx]
end

class Array

  # Monkey patch the Array class and add a my_inject method. If my_inject receives
  # no argument, then use the first element of the array as the default accumulator.

  def my_inject(accumulator = nil, &prc)
    i = 0
    if accumulator.nil?
      accumulator = self[0]
      i += 1
      # accumulator += 1
    end
    while i < self.length
      # yield self[i]
      accumulator = prc.call(accumulator, self[i])
      i += 1

    end
    accumulator
  end
end

class Array

  def my_all?(&prc)
    self.each do |el|
      return false if !prc.call(el)
    end
    true
  end

end

class Array
  def bubble_sort!(&prc)
    if !block_given?
      prc = Proc.new { |a, b| a <=> b  }
    end
    # arr = self.dup
    #if i t does a swap, set to false
    flag = false
    while !flag
      flag = true
      i = 0
      arr = self.dup
      while i < self.length - 1
        prc.call(self[i], self[i+1])
        # flag = false if (prc.call(self[i], self[i+1]) != 0)
        i += 1
      end
      self.each_index { |j| flag = true if self[j] != arr[j] }
    end
    self
  end

  def bubble_sort(&prc)

  end
end
