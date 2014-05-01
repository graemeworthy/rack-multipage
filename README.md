# Rack::Multipage

sometimes it's nice to see the effect of changes on multiple pages at once.


## Installation

Add this line to your application's Gemfile:

    gem 'rack_multipage'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack_multipage

### If you are Using Rails

in your development.rb file

    config.middleware.use Rack::MultiPage, pages: ["/", "/users/1", "/login"]

then navigate your browser to "/multipage"

Those pages will be loaded into a series of iframes.

### If you are using it with other Rack Middlewares

probably in your config.ru file:

    use Rack::MultiPage, pages: ["/", "/users/1", "/login"]


## Usage

to change the path from /multipage to something else

    use Rack::MultiPage, route: "/something_else"


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
