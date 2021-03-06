require "rack-multipage/version"

# Rack::MultiPage
# sometimes it's nice to see the effect of changes on multiple pages at once.
#
# in your development.rb file
# config.middleware.use Rack::MultiPage, pages: ["/", "/users/1", "/login"]
#
# then go to "/multipage"
# Those pages will be loaded into a series of iframes.

class Rack::MultiPage
  attr_accessor :app
  attr_reader   :pages_list
  attr_reader   :route
  attr_reader   :width
  attr_reader   :height
  attr_reader   :percentage

  def initialize (app, config = {})
    @app          = app
    @pages_list   = config.fetch :pages,  []
    @route        = config.fetch :route,  "/multipage"
    @width        = config.fetch :width,  800
    @height       = config.fetch :height, 600
    @percentage   = config.fetch :percentage,  50

  end

  def call(env)
    if env["REQUEST_PATH"] == route
      [200, {"Content-Type" => "text/html"}, [template(insides)]]
    else
      app.call(env)
    end
  end

  def scale
    percentage / 100.0
  end

  def css
    <<-CSS
    body {
      background-color: #ccc;
      padding: 0; margin:0;
    }

    div.pageboxes {
      height: 100%;
      width: 100%;
    }

    div.pageboxes .page {
      height: #{height}px;
      width:  #{width}px;
      border: solid 1px black;
      background-color: white;
      top: 0;
      -webkit-transform: scale(#{scale}) ;
      -webkit-transform-origin: top left ;
      -webkit-box-shadow: 1px 1px 5px rgba(100,100,100,0.6)
    }

    div.pageboxes .box{
      width: #{width * scale}px;
      height: #{height * scale}px;
      margin-left: 10px;
      margin-top: 10px;
      float: left;
    }

    div.pageboxes .page iframe{
      height: 100%;
      width: 100%;
      border: solid 1px #eee;
      border-radius: 5px;
    }

    CSS
  end

  def template(insides)
    <<-TEMPLATE
    <html>
    <head>
    <style>
    #{css}
    </style>
    </head>
    <body>

    <div id="insides">
    #{insides}
    </div>
    </body>
    </html>
    TEMPLATE
  end

  def page_boxes
    output = "<div class='pageboxes'>"
    @pages_list.each {|page|
      output << <<-BOX

      <div class="box">
      <a href="#{page}">#{page}</a>
      <div class="page">
      <iframe src="#{page}"></iframe>
      </div>
      </div>

      BOX
    }
    output << "</div>"
    output
  end

  def insides
    page_boxes
  end

end
