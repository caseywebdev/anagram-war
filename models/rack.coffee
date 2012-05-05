_ = require 'underscore'
Backbone = require 'backbone'

@include = ->
  @shared '/js/models/rack.js': ->
    
    root = window ? global
    
    class root.Rack extends Backbone.Collection
      
      model: Tile
      
      played: []
      
      randomize: ->
        @reset _.map Tile.DISTRIBUTION, (die) ->
          new Tile letter: die[Math.floor Math.random() * die.length]
      
      word: ->
        @reduce (letters, tile) ->
          letters += tile.get 'letter' if tile.get 'isPlayed'
          letters
        , ''
      
      validWord: ->
        Dictionary.hasWord @word()
      
      # Values are based on word length
      # http://en.wikipedia.org/wiki/Boggle
      value: ->
        Rack.wordValue @word()
        
      @wordValue: (word) ->
        length = word.length
        if Dictionary.hasWord(word) and length > 2
          switch length
            when 3, 4 then return 1
            when 5 then return 2
            when 6 then return 3
            when 7 then return 5
            else return 11
        0
      
      play: (letter) ->
        letter = 'qu' if letter == 'q'
        for tile in @models
          if tile.get('letter') is letter and not tile.get 'isPlayed'
            @remove tile
            @add tile
            return true
        false
