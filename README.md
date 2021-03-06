# Rack::Multipage
## It puts little thumbnails of other pages on a page.

Sometimes it's nice to see the effect of changes on multiple pages at once, like for example when you are editing css.

This is a rack middleware that creates a page with multiple little, shrunken-down versions of other pages on it. Thumbnails of them. These thumbnails are iFrames, and they've been shunken down with css.

It works with any Rack app. Ruby on Rails is a Rack app, so it works with Rails.




## Installation

Add this line to your application's Gemfile:

    gem 'rack-multipage'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-multipage

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

That's maybe unclear: you set the route, and the pages as a configuration hash, so it would most likely look like this in your app.

    use Rack::MultiPage, route: "/something_else", pages: ["/", "/users/1", "/login"]

Two of them? sure! Just use different routes.

    use Rack::MultiPage,
      route: "/sales_pages",
      pages: [ "/buy_it",
               "/buy_it_now",
               "/buy_it_please"]
    use Rack::MultiPage,
      route: "/preview_error_pages",
      pages: [ "/500",
               "/404",
               "/410"]

## Configuration

Out of the box the pages are rendered as 50% thumbnails of 800 * 600 pages.

here are the configuration variables

 - height: default 800
 - width: default 600
 - percentage: default 50

    use Rack::MultiPage, {height: 1200, percentage: 25,  pages: ["/", "/users/1", "/login"]}

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
