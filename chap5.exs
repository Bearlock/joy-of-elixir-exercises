secondsInDays = fn (days) -> days * 86400 end
averageAge = fn (map1, map2) -> (map1["age"] + map2["age"]) / 2 end
fahrenheitToCelcius = fn (temp) -> (temp - 32) / 1.8 end
makePersonMap = fn (n, a) -> %{"name" => n, "age" => a} end

erick = makePersonMap.("Erick", 26)
sam = makePersonMap.("Sam", 25)

IO.puts("\nThere are #{secondsInDays.(2)} seconds in two days")
IO.puts("Erick and Sam's average age is #{averageAge.(erick, sam)}")
IO.puts("212 degrees fahrenheit is #{fahrenheitToCelcius.(212)} celcius\n")
