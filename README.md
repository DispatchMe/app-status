# AppStatus

Add JSON formatter status report for Rails / Sinatra app:
```json
{
  "PostgreSQL": "OK",
  "Redis": "Down",
  "Sidekiq": "Down",
  "env": "staging"
}
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'app-status'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install app-status

## Usage

### Rails

in `config/routes.rb` add following line:
```ruby
  mount AppStatus::App.new => '/status'
```

### Sinatra
in `config.ru` add following:
```ruby
require 'your_sinatra_app'
require 'app_status/app'

run Rack::URLMap.new('/' => YourSinatraApp.new, '/status' => AppStatus::App.new)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/app_status/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
