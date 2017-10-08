require 'byebug'
class Array

  def my_join(str = "")
    string = ""
    self.each_index do |i|
      string += self[i]
      string += str if i < self.length - 1
    end
    string
  end

end

class Array

  # Takes a multi-dimentional array and returns a single array of all the elements
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
  def my_flatten
    my_controlled_flatten(1000)
  end

  # Write a version of flatten that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,[5]]
  def my_controlled_flatten(n)
    return self if n < 1
    i = 0
    flattened = []
    while i < self.length
      if self[i].is_a?(Array)
        flattened += self[i].my_controlled_flatten(n-1)
      else
        flattened << self[i]
      end
      i += 1
    end
    # depth -= 1
    flattened

    # while i < self.length
    #   if self[i].is_a?(Array)
    #     depth += 1
    #     j = 0
    #     while j < self[i].length
    #       depth += 1
    #       k = 0
    #     end
    #     j += 1
    #   end
    # end
  end
end

class Array

  def my_reject(&prc)
    selected = []
    self.each do |el|
      selected << el if !prc.call(el)
    end
    selected
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

# Jumble sort takes a string and an alphabet. It returns a copy of the string
# with the letters re-ordered according to their positions in the alphabet. If
# no alphabet is passed in, it defaults to normal alphabetical order (a-z).

# Example:
# jumble_sort("hello") => "ehllo"
# jumble_sort("hello", ['o', 'l', 'h', 'e']) => 'ollhe'

def jumble_sort(str, alphabet = nil)
  if alphabet.nil?
    alphabet = ('a'..'z').to_a
  end
  sorter = Proc.new { |a, b| alphabet.index(a) > alphabet.index(b) }
  i = 0
  while i < str.length - 1
    j = i + 1
    while j < str.length
      str[i], str[j] = str[j], str[i] if sorter.call(str[i], str[j])
      j += 1
    end
    i += 1
  end
  str
end



if __FILE__ == $PROGRAM_NAME

end
