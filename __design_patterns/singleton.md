# Design pattern : Singleton

Blog resource: https://dalibornasevic.com/posts/9-ruby-singleton-pattern

## When to use - What it solves



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

# PHP

# Javascript

# Python
