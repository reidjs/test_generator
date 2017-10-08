require 'byebug'
# make better change problem from class
# make_better_change(24, [10,7,1]) should return [10,7,7]
# make change with the fewest number of coins

# To make_better_change, we only take one coin at a time and
# never rule out denominations that we've already used.
# This allows each coin to be available each time we get a new remainder.
# By iterating over the denominations and continuing to search
# for the best change, we assure that we test for 'non-greedy' uses
# of each denomination.

def make_better_change(value, coins)
  return coins if value <= 0

  coins.each_index do |i|
    # if make_better_change(value, coins[i..-1])
  end
  change

end

# Write a recursive method that takes in a string to search and a key string.
# Return true if the string contains all of the characters in the key
# in the same order that they appear in the key.
#
# string_include_key?("cadbpc", "abc") => true
# string_include_key("cba", "abc") => false
def string_include_key?(string, key)

end

class Array
  def my_rotate(num=1)
    num += 1 if num == 0
    rotated = self.dup
    self.each_with_index do |el, i|
      rotated[(i - num).abs % count] = el
    end
    rotated
  end

end

class Array

  #Write a monkey patch of quick sort that accepts a block
  def my_quick_sort(&prc)

  end

end

class Array

  # Write an Array#merge_sort method; it should not modify the original array.

  def merge_sort(&prc)
    return self if count < 2

    if !block_given?
      prc = Proc.new { |a, b| a <=> b }
    end
    mid_idx = count/2
    left = self[0 ... mid_idx]
    right = self[mid_idx .. -1]
    # byebug
    i = 0
    left.each do |el|
      prc.call()
    end
    prc.call(left, right)
    sorted_left = left.merge_sort(&prc)
    sorted_right = right.merge_sort(&prc)
    Array.merge(sorted_left, sorted_right)
  end

  private
  def self.merge(left, right, &prc)
    #assumes left and right are sorted
    merged = []
    while !left.empty? && !right.empty?
      l_el = left.shift
      r_el = right.shift
      sorter = [l_el, r_el]
      prc.call()
    end
    return merged + right if left.empty?
    return merged + left if right.empty?

  end
end
if $PROGRAM_NAME == __FILE__
  [4,2,5,2].merge_sort
end
