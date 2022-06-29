=begin
Roman Numerals

Write some code that converts modern decimal numbers into their Roman number equivalents.

The Romans were a clever bunch. They conquered most of Europe and ruled it for hundreds of years. They invented concrete and straight roads and even bikinis. One thing they never discovered though was the number zero. This made writing and dating extensive histories of their exploits slightly more challenging, but the system of numbers they came up with is still in use today. For example the BBC uses Roman numerals to date their programmes.

The Romans wrote numbers using letters - I, V, X, L, C, D, M. Notice that these letters have lots of straight lines and are hence easy to hack into stone tablets.

 1  => I
10  => X
 7  => VII
 

There is no need to be able to convert numbers larger than about 3000. (The Romans themselves didn't tend to go any higher)

Wikipedia says: Modern Roman numerals ... are written by expressing each digit separately starting with the left most digit and skipping any digit with a value of zero.

To see this in practice, consider the example of 1990. In Roman numerals, 1990 is MCMXC:

1000=M
900=CM
90=XC

2008 is written as MMVIII:

2000=MM
8=VIII
=end

class RomanNumeral
  attr_reader :places

  def initialize(num)
    @places = num.digits
  end

  def to_roman
    result = Array.new
    (0...places.size).each do |index|
      result << to_numerals(index, places[index])
    end
    result.reverse.join
  end

  def to_numerals(place, val)
   case place
    when 0
      letters = ['I', 'V', 'X']
    when 1
      letters = ['X', 'L', 'C']
    when 2
      letters = ['C', 'D', 'M']
    end
    place < 3 ? transform(letters, val) : 'M' * val
  end

  def transform(letters, val)
    base, fives, tens = letters
    result = base * val
    if result.count(base) > 3
      remnant = 5 - (10 % result.count(base))
      case result.count(base)
        when 4
          result = base + fives
        when 5
          result = fives
        when 9
          result = base + tens
        when 10
          result = tens
        else
          result = fives + transform(letters, remnant)
      end
    end
    result
  end
end
