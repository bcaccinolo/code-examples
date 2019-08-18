
Some lines to test the monads with `dry-monads`.

Why test dry-monads?
I remember having a colleague always talking about Haskell and its famous monads.
It was my first contact with this concepts.
At that time, I didn't really understand what it was about.

Until recently, I ended reading the page of the project `dry-monads`.
I wanted to be able to chain my methods in a simple manner without `if` blocks making the code less readable.
I've ended up with 2 solutions:
  - `catch / throw` a built-in concept in Ruby
  - `Result` monads implementing objects `Success` and `Failure`.

##
