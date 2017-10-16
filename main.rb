require 'date'
require_relative 'data'

puts "Print an array of just the zodiac signs:"
puts Items::Zodiac.keys.map { |key| puts key.to_s }

puts "Convert all dates from class String to class Date:"
Items::Zodiac.each do |key, value|
	puts Date.parse(value[:start_date])
end

# Create a new hash where the keys are the elements and the value is an array of the signs of each element.
# Print this out
elements_hash = {}
Items::Zodiac.each { |key, value| elements_hash[value[:element]] = []}
Items::Zodiac.each { |key, value| elements_hash[value[:element]].push(key)}
puts elements_hash

puts "Go through the new hash and convert all zodiac sign names to all capital letters:"
elements_hash.each { |key, array| array.each { |item| puts item.to_s.upcase}}

# With the hash zodiac, for each sign, print out a sentence that has the following format:
# "The [name of sign], from [start date] to [end date] is a [element] sign."
Items::Zodiac.each do |key, value|
	puts "The #{key}, from #{value[:start_date]} to #{value[:end_date]} is a #{value[:element]} sign."
end

puts "The signs in the second and third quarters of the year (April through September) are:"
Items::Zodiac.each do |key, value|
	if Date.parse(value[:start_date]).month >=4 && Date.parse(value[:start_date]).month <=9
		puts "#{key} #{value[:start_date]}"
	end
end

# Partition the array chinese_animal_zodiac into two arrays. One should contain the strings that
# start with letters A-M. The other should contain strings that start with letters N-Z.
animals_A_M = Items::Chinese_animal_zodiac.find_all { |animal| animal[0].ord <= 77 }
animals_N_Z = Items::Chinese_animal_zodiac.find_all { |animal| animal[0].ord >=78 }

puts "Animals A to M are: "
puts animals_A_M.sort
puts "Animals N to Z are: "
puts animals_N_Z.sort

# Create a new array of numbers where each number is a length of the strings in
# chinese_animal_zodiac. Add all these numbers to get the total.
lengths_arr = Items::Chinese_animal_zodiac.map { |animal| animal.length}
sum = lengths_arr.reduce { |x, y| x + y}
puts "The sum of all characters in all the animal names in the Chinese zodiac is:"
puts sum

# Sort the array chinese_animal_zodiac so that the shortest word is the first element
# and the longest word is the last element.
animals_sorted = Items::Chinese_animal_zodiac.sort_by { |animal| animal.length }
puts "The animals sorted by word length is as follows:"
puts animals_sorted

# Print out all words that start with the letter "R".
puts "The words with the letter are are"
puts Items::Chinese_animal_zodiac.select { |word| word[0] == 'R'}
