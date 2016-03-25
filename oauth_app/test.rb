h = Hash.new { |hash, key| hash[key] = [] }

h.store('apple',[150,3])
h.store('banana', [200,2])
h.store('lemon', [300,1])

# h.each_pair {|key, value| puts "#{key}: #{value[0]}"}
h.each {|key, value| p "#{key}: #{value[0]}"}