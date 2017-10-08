def rec_sum(nums)
  return 0 if nums.empty?
  nums[0] + rec_sum(nums.drop(1))
end

class Array

  def my_rotate(num=1)
    rotations = num % size
    rotated_arr = self.dup

    rotations.times do
      rotated_arr << rotated_arr.shift
    end

    rotated_arr
  end

end

class Array

  def my_flatten
    flattened = []
    self.my_each do |el|
      el.is_a?(Array) ? flattened += el.my_flatten : flattened << el
    end
    flattened
  end

  def my_controlled_flatten(n)
    return self if n < 1
    result = []

    each do |el|
      if el.is_a?(Array)
        result += el.my_controlled_flatten(n-1)
      else
        result << el
      end
    end

    result
  end

end

class Array
  def merge_sort(&prc)
    # See how I create a Proc if no block was given; this eliminates
    # having to later have two branches of logic, one for a block and
    # one for no block.
    prc ||= Proc.new { |x, y| x <=> y }

    return self if count <= 1

    midpoint = count / 2
    sorted_left = self.take(midpoint).merge_sort(&prc)
    sorted_right = self.drop(midpoint).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, &prc)

  end

  private
  def self.merge(left, right, &prc)
    merged = []

    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left)
    merged.concat(right)

    merged
  end
end

