fs = require 'fs'
path = require 'path'
_ = require 'underscore'
Backbone = require 'backbone'
requireRecursive = (file) ->
  results = []
  if fs.lstatSync(file).isDirectory()
    _(fs.readdirSync file).each (sub) ->
      results.push requireRecursive path.join file, sub
  else unless file is __filename
    results.push require file
  _.flatten results

require('zappajs') ->
  
  @use
    static: __dirname + '/../public'
  
  @configure
    production: =>
      @enable 'minify'
        
  _(requireRecursive __dirname).each (fn) => fn.call @
