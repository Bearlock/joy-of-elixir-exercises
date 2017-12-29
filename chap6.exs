averageAgeMulti = fn
  (map1, map2) -> (map1["age"] + map2["age"]) / 2
  (map1, map2, map3) -> (map1["age"] + map2["age"] + map3["age"]) / 3
end

helloNameAge = fn
  %{"name" => name, "age" => age} -> "Whoa #{name}, you're #{age} years old!"
  %{"name" => name} -> "Hey there #{name}"
end
