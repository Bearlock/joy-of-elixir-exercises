# joy-of-elixir-exercises

As the name pretty much implies, this is a repository for the exercises within [Joy of Elixir](joe); it's a pretty simple and gentle introduction to Elixir and programming in general.

## Chapter 1 Exercises

The first chapter was about all the simple things; variables, types, computation. etc. The exercises were pretty much _calculate the number of seconds in a day_ and _calculate the average of these numbers_. I opted to use `IO.puts` to print my output.

## Chapter 2 Exercises

The second chapter focused on strings. The exercises were _use a string within another string_ and _use string interpolation to store the number of seconds that are in a month_. I again opted to print stuff using `IO.puts`

## Chapter 3 Exercises

No exercises

## Chapter 4 Exercises

No exercises

## Chapter 5 Exercises

I'm at the point of semantic satiation; exercise is starting to look like a really weird word. Anyway, chapter 5 was an intro to functions. The exercises were _make a function that turns fahrenheit temps into celcius_, _make a function to return the number of seconds in a number of days_, and _make a function that takes two maps with age keys and calculates their average age_. I wrote an additional little helper function to more easily create these maps in the form of `makePersonMap()`.

## Chapter 6 Exercises

Chapter 6 dealt with pattern matching (one of my favorite things about ML, and probably most functional languages). The exercises were _make a function that could take either two or three maps containing the key "age", and averages the ages_ and _make a function that takes either a map containing a "name" and "age", or just a map containing "name". Change the output depending on if "age" is present_.

**Iteration 1**: This isn't working :grin: . I'm trying to define a function with clauses that require different _arity_ (number of arguments); that isn't allowed. Functions always have to have a fixed, non-variable arity. I did learn a few things though, but first, bad code for posterity's sake:

```elixir
averageAgeMulti = fn
  (map1, map2) -> (map1["age"] + map2["age"]) / 2
  (map1, map2, map3) -> (map1["age"] + map2["age"] + map3["age"]) / 3
end
```

Turns out that Elixir has two different kinds of functions; named ones and anonymous ones. Anonymous functions are defined with `fn` and are closures. [This link](fnversusdef) does a really great job of explaining the difference between the two; I'm gonna borrow the examples. Closure:

```elixir
x = 5
addFive = fn (y) -> y + x
addFive.(3) # This is gonna return 8
```

`addFive/1` has an arity of 1, and since it's an anonymous function, it has access to the surrounding scope. Named functions don't; they create their own function scope.

```elixir
x = 5
def addFive(y) do
   y + x
end
addFive(3) # Not possible; heck we don't even get here. Compile time error is caused above
```

`x` isn't accessible to the function since it now has it's own scope. It _is_ possible to fix this though:

```elixir
def addFive(y) do
  x = 5
  y + x
end
```

I also just barely learned that named functions have to exist within a module. So a complete example of the function above look like this:

```elixir
defmodule Adder do
  def addFive(y) do
    x = 5
    y + x
  end
end

Adder.addFive(3) # This'll return 8!
```

I learned a lot! Thank goodness for a little bit of failure.

**Iteration 2**: This second iteration works! Instead of trying to define a function with clauses that require different arity, I leveraged pattern matching and instead passed in a list of maps. While writing the second function I also found out that order of clauses matter in terms of specifcity. The most specific pattern clause (In my case, the one that matches both age and name) should go first and less specific clauses should follow (one that matches only for name). Otherwise, it's possible that other clauses will never be matched. Elixir will match the first pattern it can.

## Chapter 7 Exercises

No exercises

## Chapter 8 Exercises

This chapter focused a lot on IO, strings, and immutability. It listed a few of the functions in the `String` module:

- `upcase/1`: Uppercases the passed in string
- `downcase/1`: Lowercases the passed in string
- `reverse/1`: Reverses the passed in string
- `split/1`: Splits the string along whitespace into a list
- `replace/3`: Replaces part of a string; takes a string, the characters to change, and what to change the characters into.

The exercise was _make a program that generates a short story. Use IO.gets to get 3 inputs, and output them as a story_.

[joe]: https://joyofelixir.com
[fnversusdef]: https://stackoverflow.com/a/18023790/7937453
