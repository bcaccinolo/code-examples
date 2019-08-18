# frozen_string_literal: true

require 'dry/monads/maybe'

M = Dry::Monads

require 'pry'; binding.pry # 🚧 🚜


User.find(42).name
User.find_by(id: 42)&.name
Maybe(User.find(42)).fmap(&:name).or(false)
