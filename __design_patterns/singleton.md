# Design pattern : Singleton

## Resources

- https://dalibornasevic.com/posts/9-ruby-singleton-pattern
- https://github.com/kamranahmedse/design-patterns-for-humans#-singleton

## When to use - What it solves

It's when you want to ensure you have just one instance of one Class.

Example: I want one instance of my main Configuration class.

# Ruby
Ruby has a module to ease them implementation of singleton classes.

The documentation http://ruby-doc.org/stdlib-1.9.3/libdoc/singleton/rdoc/Singleton.html


```ruby
require 'singleton'

class Logger
  include Singleton

  def initialize
    @log = File.open("log.txt", "a")
  end

  def log(msg)
    @log.puts(msg)
  end
end

Logger.instance.log('message 2')

```

