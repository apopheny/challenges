=begin
Scrabble Score

Write a program that, given a word, computes the Scrabble score for that word.

Letter Values

You'll need the following tile scores:
Letter 	Value
A, E, I, O, U, L, N, R, S, T 	1
D, G 	2
B, C, M, P 	3
F, H, V, W, Y 	4
K 	5
J, X 	8
Q, Z 	10

How to Score

Sum the values of all the tiles used in each word. For instance, lets consider the word CABBAGE which has the following letters and point values:

    3 points for C
    1 point for each A (there are two)
    3 points for B (there are two)
    2 points for G
    1 point for E

Thus, to compute the final total (14 points), we count:

3 + 2*1 + 2*3 + 2 + 1
=> 3 + 2 + 6 + 3
=> 5 + 9
=> 14
=end

class Scrabble
  @@scores = {
              %w(a e i o u l n r s t) => 1, 
              %w(d g) => 2, 
              %w(b c m p) => 3, 
              %w(f h v w y) => 4, 
              ['k'] => 5, 
              %w(j x) => 8, 
              %w(q z) => 10
             }

  def self.score(word)
    Scrabble.new(word).score
  end
  
  def initialize(str)
    str.class == String ? @to_score = str.downcase.chars : @to_score = str
  end

  def score(other_word = @to_score)
    return 0 if @to_score.class != Array

    result = 0
    @@scores.each do |letters, score|
      @to_score.each do |char|
        result += score if letters.include?(char)
      end
    end

    result
  end
end
