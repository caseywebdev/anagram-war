@include = ->
  # Set the static public directory
  @use
    static: __dirname + '/public'
    
  # Minify production code
  @configure
    production: =>
      @enable 'minify'
