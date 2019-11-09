require_relative 'config'

module Hello
  class App
    def self.main
      puts "app launched... #{} 💥"
    end

    class << self
      attr_accessor :configuration
    end

    def self.configuration
      @configuration ||= Hello::Config.new
    end

    def self.configure
      yield(configuration)
    end

  end
end

Hello::App.main()
Hello::App.configure do |config|
  coucou = "test"
end
puts Hello::App.configuration
