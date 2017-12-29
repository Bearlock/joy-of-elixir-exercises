place = IO.gets "Hello! Gimme a place: "
action = IO.gets "Awesome! Now gimme an action: "
object = IO.gets "Perfect; last one, gimme an object: "
IO.puts "The quick brown #{String.trim(object)} #{String.trim(action)}ed over the lazy #{String.trim(place)}!"
