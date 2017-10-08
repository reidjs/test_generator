require 'byebug'
# Write a recursive method that returns the sum of all elements in an array
def rec_sum(nums, sum = 0)
  return sum if nums.empty?
  p sum
  sum += nums.pop
  rec_sum(nums, sum)
end

class Array

  def my_rotate(num=1)
    rotated = Array.new(self.length, 0)
    i = self.length - 1
    while i >= 0
      new_idx = (num - i) % self.length
      rotated[new_idx] = self[i]
      i -= 1
    end
    rotated
  end

end

class Array

  # Takes a multi-dimentional array and returns a single array of all the elements
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,5]
  def my_flatten
    flat = []
    self.each do |el|
      if el.is_a? (Array)
        flat += el.my_flatten
      else
        flat << el
      end
    end
    flat
  end

  # Write a version of flatten that only flattens n levels of an array.
  # E.g. If you have an array with 3 levels of nested arrays, and run
  # my_flatten(1), you should return an array with 2 levels of nested
  # arrays
  #
  # [1,[2,3], [4,[5]]].my_controlled_flatten(1) => [1,2,3,4,[5]]
  def my_controlled_flatten(n)
    flat = []
    i = 0
    while i < self.length
      m = 0
      if self[i].is_a?(Array) && m <= n
        p m, n
        flat << self[i].my_flatten
        m += 1
      else
        flat << self[i]
      end
      i += 1
    end
    flat
  end
end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    if !block_given?
      prc = Proc.new { |a, b| a <=> b }
    end
    #NOTE count can be used because it will call self.count
    return self if count < 2
    mid_idx = count/2
    left_arr = self[0...mid_idx]
    right_arr = self[mid_idx..-1]
    sorted_left = left_arr.merge_sort(&prc)
    sorted_right = right_arr.merge_sort(&prc)
    #sort left without sort method
    # i = 0
    # while i < left_arr.length - 1
    #   if prc.call(left_arr[i], left_arr[i + 1]) < 0
    #     left_arr[i], left_arr[i + 1] = left_arr[i + 1], left_arr[i]
    #   end
    #   i += 1
    # end
    #sort right without sort method
    # i = 0
    # while i < right_arr.length - 1
    #   if prc.call(right_arr[i], right_arr[i + 1]) < 0
    #     right_arr[i], right_arr[i + 1] = right_arr[i + 1], right_arr[i]
    #   end
    #   i += 1
    # end
    #if sort method allowed sort_left = left_arr.sort(&prc)
    # sort_right = right_arr.sort(&prc)
    #sort right
    #merge left and right
    # byebug
    Array.merge(sorted_left, sorted_right, &prc)
  end

  private
  def self.merge(left, right, &prc)
    #left and right are already sorted according to prc
    merged = []
    while !left.empty? || !right.empty?
      return merged + left if right.empty?
      return merged + right if left.empty?
      if prc.call(left[0], right[0]) > 0
        merged << right.shift
      else
        merged << left.shift
      end
    end
    merged
  end
end
# sorter = Proc.new { |a, b| b <=> a }
# p [5,4,8,3,6,10].merge_sort()
# p Array.merge([1,8,9,10].reverse, [], &sorter)
