# Concern pattern

```
A good way to put code under the carpet.
```

DHH: https://signalvnoise.com/posts/3372-put-chubby-models-on-a-diet-with-concerns

Concern is usefull to share a set of cross-cutting methods in your models or controllers.
Example: Trashable, Searchable, Visible, Movable, Taggable.

But I think that it's a bad solution when you feel like splitting your class this way, it should ring a bell. The bell of bad code smell. If your model is too big, it's that it has too many responsabilities. It should be splitted. But you should not put some code under the carpet with `concerns`.

```ruby
module Taggable
  extend ActiveSupport::Concern

  included do
    has_many :taggings, as: :taggable, dependent: :destroy
    has_many :tags, through: :taggings
  end

  def tag_names
    tags.map(&:name)
  end
end
```


## Concern is not so good

http://mcdowall.info/the-great-satan-rails-concerns/

ActiveSupport::Concern actually makes your code base worse. They make it:

 - **Harder to reason about** the code you are currently reading. You must satisfy several mental dependencies before you can make any kind of informed change in the code you are looking at. This increased mental barrier also makes it more likely that a developer will make a mistake in the code they are changing inside a concern.

 - **Harder to navigate the codebase**. If I want to look at the `make_coat_type` method, I have to already know that it:
    - Doesn’t live on the main Monster model.
    - Is actually inside another file which contains a different Concern

 - Encourage a use of Modules that is just as bad as ‘The Kitchen Drawer’ approach to using the lib directory that we know is bad, but this time it’s at a much more fine grained line-of-code level.
