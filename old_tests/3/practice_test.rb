require 'byebug'
# return b^n recursively. Your solution should accept negative values
# for n
def exponent(b, n)
  return 1 if n == 0
  return b if n == 1
  if n > 1
    b * exponent(b, n - 1)
  else
    1.0/b * (exponent(b, n + 1))
  end
end

class Array

  def my_join(str = "")

  end

end

class String
  # Returns an array of all the subwords of the string that appear in the
  # dictionary argument. The method does NOT return any duplicates.

  def real_words_in_string(dictionary)
    real_words = []
    i = 0
    while i < self.length - 1
      j = i + 1
      while j < self.length
        word = self[i..j]
        real_words << word if in_dict?(word, dictionary)
        j += 1
      end
      i += 1
    end
    real_words
  end
end

def in_dict?(word, dictionary)
  dictionary.include?(word)
end

class Array

  def my_zip(*arrs)
    # return arrs[0] if arrs.length == 1
    zipped = []
    i = 0
    while i < arrs.length
      zipped << []
      j = 0
      arrs.each do |arr|
        zipped[i] << arr[j]
        j += 1
      end
      i += 1
    end
    zipped
  end

end

if __FILE__ == $PROGRAM_NAME

end
