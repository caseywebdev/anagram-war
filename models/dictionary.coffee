fs = require 'fs'
_ = require 'underscore'
Backbone = require 'backbone'

@include = ->
  
  @shared '/js/models/dictionary.js': ->
        
    root = window ? global
    
    root.Dictionary =
      
      hasWord: (word) ->
        !!Dictionary.words[word]        
      
  Dictionary.words = _.reduce @words, (obj, word) ->
    obj[word] = true
    obj
  , {}