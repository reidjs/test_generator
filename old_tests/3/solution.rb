def exponent(b, n)
  return 1 if n == 0

  if n > 0
    b * exponent(b, n - 1)
  else
    1.0/b * exponent(b, n + 1)
  end
end

class Array

  def my_join(str = "")
    res = ""
    my_each_with_index do |el, i|
      res << el.to_s
      res << str unless i == size - 1
    end

    res
  end

end


class String
  def real_words_in_string(dictionary)
    real_words = []
    (1...self.length - 1).each do |first|
      (first + 1...self.length).each do |last|
        word = self[first...last]
        if dictionary.include?(word)
          real_words << word unless real_words.include?(word)
        end
      end
    end
    real_words
  end
end

class Array

  def my_zip(*arrs)
    result = []
    (0...size).each do |idx|
      result << [self[idx]]
      arrs.each do |arr|
        result[idx] << arr[idx]
      end
    end

    result
  end

end

