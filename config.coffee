_ = require 'underscore'
fs = require 'fs'

@include = ->
  # Set the static public directory
  @use
    static: __dirname + '/public'
    
  # Minify production code
  @configure
    production: =>
      @enable 'minify'

  @io.configure 'production', =>
    @io.enable('browser client minification');
    @io.enable('browser client etag');
    @io.enable('browser client gzip');
    @io.set('log level', 1);
    @io.set 'transports', [
      'websocket',
      'flashsocket',
      'htmlfile',
      'xhr-polling',
      'jsonp-polling'
    ]
  
  @words = _.filter fs.readFileSync('lib/dictionary.txt').toString().split("\n"), (word) -> word
