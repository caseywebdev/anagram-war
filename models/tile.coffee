Backbone = require 'backbone'

@include = ->
  @shared '/js/models/tile.js': ->
    
    root = window ? global
    
    class root.Tile extends Backbone.Model
      
      # Based off of the standard Boggle tile distribution
      # Retrieved from http://everything2.com/title/Boggle
      # 'letter' : occurances
      @DISTRIBUTION: [
        ['A', 'E', 'A', 'N', 'E', 'G']
        ['A', 'H', 'S', 'P', 'C', 'O']
        ['A', 'S', 'P', 'F', 'F', 'K']
        ['O', 'B', 'J', 'O', 'A', 'B']
        ['I', 'O', 'T', 'M', 'U', 'C']
        ['R', 'Y', 'V', 'D', 'E', 'L']
        ['L', 'R', 'E', 'I', 'X', 'D']
        ['E', 'I', 'U', 'N', 'E', 'S']
        ['W', 'N', 'G', 'E', 'E', 'H']
        ['L', 'N', 'H', 'N', 'R', 'Z']
        ['T', 'S', 'T', 'I', 'Y', 'D']
        ['O', 'W', 'T', 'O', 'A', 'T']
        ['E', 'R', 'T', 'T', 'Y', 'L']
        ['T', 'O', 'E', 'S', 'S', 'I']
        ['T', 'E', 'R', 'W', 'H', 'V']
        ['N', 'U', 'I', 'H', 'M', 'Qu']
      ]