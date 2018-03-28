# Presenter


```ruby
  def portfolio_switch
    @portfolio_switch ||= Presenters::PortfolioSwitch.new(header_content.accessible_portfolios, current_portfolio)
  end
```

The `Presenter::PortfolioSwitch` is in charge of structuring a data structure to manage Portfolios.

