# Input: sentence string
# Output: array of integers
# Rules: Integers in array align with each word in the sentence
# Test case:
# string_lenghts("Dogs are cute")
# string_lenghts("Fun")

# def string_lenghts(sentence)
#   strings = sentence.split
#   strings.map { |chars| chars.length }
# end



def string_lenghts(sentence)
  strings = sentence.split
  lengths = []
  counter = 0

  until counter == strings.size do
    word_length = strings[counter - 1].length
    lengths.push(word_length)
    counter += 1
  end

  lengths
end

p string_lenghts("Dogs are cute")
p string_lenghts("Fun")
