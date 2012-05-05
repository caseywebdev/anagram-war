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
  "#{__dirname}/models/dictionary.coffee"
  "#{__dirname}/models/user.coffee"
  "#{__dirname}/models/tile.coffee"
  "#{__dirname}/models/rack.coffee"
  "#{__dirname}/models/battle.coffee"
  "#{__dirname}/views"
  "#{__dirname}/controllers"
  "#{__dirname}/client"
  "#{__dirname}/stylus"
]

# Start the server
require('zappajs') (if process.env.NODE_ENV is 'production' then 80 else 3000), ->
    
  # Import requirements
  _.each reqs, (req) =>
    _.each requireRecursive(req), (fn) =>
      fn?.call? @
