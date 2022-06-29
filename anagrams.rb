=begin
Anagrams

Write a program that takes a word and a list of possible anagrams and selects the correct sublist that contains the anagrams of the word.

For example, given the word "listen" and a list of candidates like "enlists", "google", "inlets", and "banana", the program should return a list containing "inlets". Please read the test suite for the exact rules of anagrams.
=end

class Anagram
  attr_reader :base_word, :letters

  def initialize(str)
    @base_word = str.downcase
    @letters = str.downcase.chars.uniq
  end

  def match(str_arr)
    str_arr.select do |other_word|
      next if base_word.casecmp?(other_word) || other_word.size != base_word.size
      
      letters.all? do |letter| 
        base_word.count(letter) == other_word.downcase.count(letter)
      end
    end
  end
end
