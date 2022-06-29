=begin
Write a program to determine whether a triangle is equilateral, isosceles, or scalene.

An equilateral triangle has all three sides the same length.

An isosceles triangle has exactly two sides of the same length.

A scalene triangle has all sides of different lengths.

Note: For a shape to be a triangle at all, all sides must be of length > 0, and the sum of the lengths of any two sides must be greater than the length of the third side.
=end

class Triangle
  def initialize(side1, side2, side3)
    @side1, @side2, @side3 = side1, side2, side3
    @sides = [@side1, @side2, @side3]
    raise ArgumentError.new('Inputs do not reflect a valid triangle') unless valid?
  end

  def valid?
    (0...@sides.size).each do |counter|
      other_lengths = @sides.sum - @sides[counter]
      return false if @sides[counter] <= 0 ||
        @sides[counter] - other_lengths >= 0
    end
    true
  end

  def kind
    case @sides.uniq.size
      when 1
        'equilateral'
      when 2
        'isosceles'
      else
        'scalene'
      end
  end
end
