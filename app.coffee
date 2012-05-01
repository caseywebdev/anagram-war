# Imports
fs = require 'fs'
path = require 'path'
_ = require 'underscore'
Backbone = require 'backbone'

# Merge collective `exports` into a single array for a given directory
requireRecursive = (file) ->
  results = []
  if fs.lstatSync(file).isDirectory()
    _(fs.readdirSync file).each (sub) ->
      results.push requireRecursive path.join file, sub
  else unless file is __filename
    results.push require file
  _.flatten results

# Directories to require
reqs = [
  __dirname + '/models'
  __dirname + '/views'
  __dirname + '/controllers'
  __dirname + '/client'
]

# Start the server
require('zappajs') ->
  
  # Set the static public directory
  @use
    static: __dirname + '/../public'
    
  # Minify production code
  @configure
    production: =>
      @enable 'minify'
  
  # Import MVCC
  _(reqs).each (req) =>
    _(requireRecursive req).each (fn) =>
      fn.call @
