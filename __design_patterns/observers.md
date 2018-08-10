# Design pattern : Observers

## Also known as publish/subscribe

The observer pattern is for event driven programming.

An object, called the subject, maintains a list of its dependents, called observers, and notifies them automatically of any state changes, usually by calling one of their methods.

The Ruby Standard Library includes an `Observable` module that implements this pattern.

It's also possible to use code blocks as observers. This isn't supported by the Observable module in the Ruby Standard Library, but it's easy to implement.

Source : https://github.com/nslocum/design-patterns-in-ruby#observer

## Ruby

As the Singleton, Observer has a ruby module to handling this pattern.

> http://ruby-doc.org/stdlib-2.4.2/libdoc/observer/rdoc/Observable.html

Observers implement the interface:

```ruby
def update(...)
```

The Observed class also callled subject registers observers like this:
```ruby
ticker.add_observer(myListenerInstance)
```

The ruby doc contains a clean example:

```ruby
require "observer"

class Ticker          ### Periodically fetch a stock price.
  include Observable

  def initialize(symbol)
    @symbol = symbol
  end

  def run
    last_price = nil
    loop do
      price = Price.fetch(@symbol)
      print "Current price: #{price}\n"
      if price != last_price
        changed                   # notify that the state has changed
        last_price = price
        notify_observers(Time.now, price) # notify observers
      end
      sleep 1
    end
  end
end

class Price           ### A mock class to fetch a stock price (60 - 140).
  def self.fetch(symbol)
    60 + rand(80)
  end
end

class Warner          ### An abstract observer of Ticker objects.
  def initialize(ticker, limit)
    @limit = limit
    ticker.add_observer(self)
  end
end

class WarnLow < Warner
  def update(time, price)       # callback for observer
    if price < @limit
      print "--- #{time.to_s}: Price below #@limit: #{price}\n"
    end
  end
end

class WarnHigh < Warner
  def update(time, price)       # callback for observer
    if price > @limit
      print "+++ #{time.to_s}: Price above #@limit: #{price}\n"
    end
  end
end

ticker = Ticker.new("MSFT")
WarnLow.new(ticker, 80)
WarnHigh.new(ticker, 120)
ticker.run
```










