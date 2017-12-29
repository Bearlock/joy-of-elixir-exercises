averageAgeMulti = fn
  [first, second, third | rest] -> (first["age"] + second["age"] + third["age"]) / 3
  [first, second | rest] -> (first["age"] + second["age"]) / 2
  [] -> "Need a list of at least 2 maps that have an age key"
end

helloNameAge = fn
  %{"name" => name, "age" => age} -> "Whoa #{name}, you're #{age} years old!"
  %{"name" => name} -> "Hey there #{name}"
end

makePersonMap = fn (n, a) -> %{"name" => n, "age" => a} end

erick = makePersonMap.("Erick", 26)
sam = makePersonMap.("Sam", 25)
nana = makePersonMap.("Adriana", 23)
moms = %{"name" => "Moms"}

IO.puts("\nThis is the average age of 2 people (erick and sam): #{averageAgeMulti.([erick, sam])}")
IO.puts("This is the average age of 3 people (erick, sam, nana): #{averageAgeMulti.([erick, sam, nana])}")
IO.puts("This is helloNameAge called with a map that contains both keys: #{helloNameAge.(erick)}")
IO.puts("This is helloNameAge called with a map that only contains name: #{helloNameAge.(moms)}\n")
