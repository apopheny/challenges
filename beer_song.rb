=begin
Beer Song

Write a program that can generate the lyrics of the 99 Bottles of Beer song. See the test suite for the entire song.
=end

class Verse
  attr_accessor :num

  def initialize(verse_num)
    @num = verse_num
  end

  def verse
    case num
    when 2
      two_left
    when 1
      one_left
    when 0
      none_left
    else
      default_verse
    end
  end

  def default_verse
    "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" + 
    "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
  end

  def two_left
    "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" +
    "Take one down and pass it around, #{num - 1} bottle of beer on the wall.\n"
  end

  def one_left
    "#{num} bottle of beer on the wall, #{num} bottle of beer.\n" +
    "Take it down and pass it around, no more bottles of beer on the wall.\n"
  end
  
  def none_left
    "No more bottles of beer on the wall, no more bottles of beer.\n" \
    "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
  end
end

class BeerSong
  def self.verse(num)
    Verse.new(num).verse
  end

  def self.verses(*verses)
    result = Array.new
    current_verse = verses[0]
    loop do
      result << Verse.new(current_verse).verse
      current_verse -= 1
      break if current_verse < verses[-1]
    end

    result.join("\n")
  end

  def self.lyrics
    BeerSong.verses(99, 0)
  end
end

