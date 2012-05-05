_ = require 'underscore'
Backbone = require 'backbone'

@include = ->
  @shared '/js/models/rack.js': ->
    
    root = window ? global
    
    class root.Rack extends Backbone.Collection
      
      model: Tile
            
      randomize: ->
        @reset _.map Tile.DISTRIBUTION, (die) ->
          new Tile letter: die[Math.floor Math.random() * die.length]
      
      word: ->
        (@reduce (letters, tile) ->
          letters += tile.get 'letter' if tile.get 'isPlayed'
          letters
        , '').toLowerCase()
      
      validWord: ->
        Dictionary.hasWord @word()
      
      # Values are based on word length
      # http://en.wikipedia.org/wiki/Boggle
      value: ->
        Rack.wordValue @word()
        
      @wordValue: (word) ->
        if word instanceof Array
          _.reduce word, (total, w) ->
            total + Rack.wordValue w
          , 0
        else
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
        letter = 'Qu' if letter == 'Q'
        for tile in @models
          if tile.get('letter') is letter and not tile.get 'isPlayed'
            tile.set isPlayed: true
            @remove tile
            @add tile
            return true
        false
      
      removeLast: ->
        last = @last().set isPlayed: false
        @remove last
        @unshift last
        @
        
      removeAll: ->
        @each (tile) ->
          tile.set isPlayed: false
        @
      