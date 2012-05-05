Backbone = require 'backbone'

@include = ->
  @shared '/js/models/tile.js': ->
    
    root = window ? global
    
    class root.Tile extends Backbone.Model
      
      @COUNT = 15
      
      # Based off of the standard Boggle tile distribution
      # Retrieved from http://everything2.com/title/Boggle
      # 'letter' : occurances
      @DISTRIBUTION:
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
