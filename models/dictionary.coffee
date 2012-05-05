fs = require 'fs'
_ = require 'underscore'
Backbone = require 'backbone'

@include = ->
  
  @shared '/js/models/dictionary.js': ->
        
    root = window ? global
    
    root.Dictionary =
            
      # Based off of the standard Boggle distribution
      # Retrieved from http://everything2.com/title/Boggle
      # <letter> : occurances
      distribution:
        'a' : 6,
        'b' : 2,
        'c' : 2,
        'd' : 3,
        'e' : 11,
        'f' : 2,
        'g' : 2,
        'h' : 5,
        'i' : 6,
        'j' : 1,
        'k' : 1,
        'l' : 4,
        'm' : 2,
        'n' : 6,
        'o' : 7,
        'p' : 2,
        'qu': 1,
        'r' : 5,
        's' : 6,
        't' : 9,
        'u' : 3,
        'v' : 2,
        'w' : 3,
        'x' : 1,
        'y' : 3,
        'z' : 1
  
  Dictionary.words = _.reduce @words, (obj, word) ->
    obj[word] = true
    obj
  , {}