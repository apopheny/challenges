=begin
Diamond

The diamond exercise takes as its input a letter, and outputs it in a diamond shape. Given a letter, it prints a diamond starting with 'A', with the supplied letter at the widest point.

    The first row contains one 'A'.
    The last row contains one 'A'.
    All rows, except the first and last, have exactly two identical letters.
    The diamond is horizontally symmetric.
    The diamond is vertically symmetric.
    The diamond has a square shape (width equals height).
    The letters form a diamond shape.
    The top half has the letters in ascending order.
    The bottom half has the letters in descending order.
    The four corners (containing the spaces) are triangles.

    Problem: Write a program which accepts a letter input. It should return a string (mutli-line if a letter after 'A' is input) which consists of an alphabetical diamond starting with 'A' until the input letter

    Input: A single-letter string
    Output: A multi-letter string

    Algorithm
      Initialize an alphabetical array, alphabet
      Initialize a local variable, result, to an empty string
      
      
      Helper method: increment
      Find the index position of the input letter in alphabet and save that to a variable, side_spaces
      Initialize a local variable, middle_spaces, to 0
      From 0 through the index position of the input in alphabet, iterate through alphabet in this fashion:
        Append side_spaces * " " to result
        Append the current index position in alphabet to result
        Append middle_spaces * " " to result
        Unless the index position is zero, append the index position element in alphabet to result
        Append side_spaces * " " to result
        Append "/n" to result
        sides_paces decremented by 1
        middle_spaces incremented by 1

      Helper method: decrement
      Reassign middle_spaces to the index position of the input letter in alphabet - 1
      Reassign side_spaces to the index position of the input letter in alphabet - 1
      From but not including the index position of the input letter in alphabet down through 0, iterate through alphabet in this fashion:
        Append side_spaces * " " to result
        Append the current index position element of alphabet to result 
        Append middle_spaces * " " to result
        Unless the index position is zero, append the index position element in alphabet to result
        Append side_spaces * " " to result
        append "/n" to result
        side_spaces incremented by 1
        middle_spaces decremented by 1

      Return result



=end

class Diamond
  ALPHABET = ('A'..'Z').to_a
  
  def self.make_diamond(letter)
    result = ""
    result << increment(letter)
    result << decrement(letter)
    result
  end

  def self.increment(letter)
    side_spaces = ALPHABET.index(letter)
    
    middle_spaces = 0
    result = ""
    (0..side_spaces).each do |index|
      result << (" " * side_spaces + ALPHABET[index] +\
      "#{index > 1 ? " " * (index + 1) : " " * index}" +\
      "#{index.zero? ? "" : ALPHABET[index]}" + " " * side_spaces + "\n")
      middle_spaces += 1
      side_spaces -= 1
    end

    result
  end

  def self.decrement(letter)
    middle_spaces = (ALPHABET.index(letter) - 1)
    side_spaces = (ALPHABET.index(letter) - 1)
    result = ""

    side_spaces.downto(0).each do |index|
      result << (" " * side_spaces + ALPHABET[index] +\
      "#{index > 1 ? " " * (index + 1) : " " * index}" +\
      "#{index.zero? ? "" : ALPHABET[index]}" + " " * side_spaces + "\n")
      middle_spaces -= 1
      side_spaces += 1
    end

    result
  end
end
