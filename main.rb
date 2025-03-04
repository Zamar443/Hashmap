require_relative 'hashmap'

test = HashMap.new(16, 0.75)

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

# Overwriting values
test.set('apple', 'dark red')
test.set('banana', 'light yellow')
test.set('carrot', 'deep orange')

# Triggering resize
test.set('moon', 'silver')

# Overwriting after resize
test.set('dog', 'dark brown')
test.set('elephant', 'light gray')

# Testing methods
puts "Apple color: #{test.get('apple')}" # Expected: dark red
puts "Has banana?: #{test.has?('banana')}" # Expected: true
puts "Removing kite: #{test.remove('kite')}" # Expected: pink
puts "Length: #{test.length}" # Expected: 12 before removal, 11 after

test.clear
puts "Length after clear: #{test.length}" # Expected: 0

puts "Keys: #{test.keys.inspect}"
puts "Values: #{test.values.inspect}"
puts "Entries: #{test.entries.inspect}"