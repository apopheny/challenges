=begin
Series

Write a program that will take a string of digits and return all the possible consecutive number series of a specified length in that string.

For example, the string "01234" has the following 3-digit series:

    012
    123
    234

Likewise, here are the 4-digit series:

    0123
    1234

Finally, if you ask for a 6-digit series from a 5-digit string, you should throw an error.
=end


class Series
  attr_reader :data

  def initialize(num)
    @data = num.chars
  end

  def slices(num)
    raise ArgumentError.new('Series is longer than dataset') if num > data.size
    result = []
    (0..data.size - num).each do |index|
      result << data[index, num].map(&:to_i)
    end
    result
  end
end
