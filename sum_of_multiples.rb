=begin
Sum of Multiples

Write a program that, given a natural number and a set of one or more other numbers, can find the sum of all the multiples of the numbers in the set that are less than the first number. If the set of numbers is not given, use a default set of 3 and 5.

For instance, if we list all the natural numbers up to, but not including, 20 that are multiples of either 3 or 5, we get 3, 5, 6, 9, 10, 12, 15, and 18. The sum of these multiples is 78.
=end

class SumOfMultiples
  def initialize(*multiples)
    @multiples = multiples.empty? ? [3, 5] : multiples
  end

  def to(num)
    SumOfMultiples.to(num, @multiples)
  end
  
  def self.to(num, multiples = [3, 5])
    result = []
    
    (0...multiples.size).each do |index|
      multiple = multiples[index]
      loop do
        result << multiple if num / multiple > 0
        multiple += multiples[index]
        break if multiple >= num
      end
    end
    
    result.uniq.sum
  end
end
