Backbone = require 'backbone'

@include = ->
  @shared '/js/models/tile.js': ->
    
    root = window ? global
    
    class root.Tile extends Backbone.Model
      
      # Based off of the standard Boggle tile distribution
      # Retrieved from http://everything2.com/title/Boggle
      # 'letter' : occurances
      @DISTRIBUTION: [
        ['A', 'E', 'A', 'N', 'E', 'G'],   ['W', 'N', 'G', 'E', 'E', 'H'],
        ['A', 'H', 'S', 'P', 'C', 'O'],   ['L', 'N', 'H', 'N', 'R', 'Z'],
        ['A', 'S', 'P', 'F', 'F', 'K'],   ['T', 'S', 'T', 'I', 'Y', 'D'],
        ['O', 'B', 'J', 'O', 'A', 'B'],   ['O', 'W', 'T', 'O', 'A', 'T'],
        ['I', 'O', 'T', 'M', 'U', 'C'],   ['E', 'R', 'T', 'T', 'Y', 'L'],
        ['R', 'Y', 'V', 'D', 'E', 'L'],   ['T', 'O', 'E', 'S', 'S', 'I'],
        ['L', 'R', 'E', 'I', 'X', 'D'],   ['T', 'E', 'R', 'W', 'H', 'V'],
        ['E', 'I', 'U', 'N', 'E', 'S'],   ['N', 'U', 'I', 'H', 'M', 'Qu']
      ]