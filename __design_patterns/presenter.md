# Presenter

Presenter is integrated in the pattern Model-View-Presenter. Views can't access directly Models. They have to
interact with Presenters.

The `Presenter::PortfolioSwitch` is in charge of structuring a data structure to manage Portfolios.

```ruby
  def portfolio_switch
    @portfolio_switch ||= Presenters::PortfolioSwitch.new(header_content.accessible_portfolios, current_portfolio)
  end
```


