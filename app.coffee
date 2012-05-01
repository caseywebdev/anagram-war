# Imports
fs = require 'fs'
path = require 'path'
_ = require 'underscore'

# Merge collective `exports` into a single array for a given directory
requireRecursive = (file) ->
  results = []
  if fs.lstatSync(file).isDirectory()
    _.each fs.readdirSync(file), (sub) ->
      results.push requireRecursive path.join file, sub
  else unless file is __filename
    results.push require(file)?.include or null
  _.flatten results

# Directories to require
reqs = [
  "#{__dirname}/config.coffee"
  "#{__dirname}/models"
  "#{__dirname}/views"
  "#{__dirname}/controllers"
  "#{__dirname}/client"
  "#{__dirname}/stylus"
]

# Start the server
require('zappajs') ->
    
  # Import requirements
  _.each reqs, (req) =>
    _.each requireRecursive(req), (fn) =>
      fn?.call? @
